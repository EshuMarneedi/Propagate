//
//  ContentView.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import SwiftData
import SwiftUI

// The URL that we pass in must be identifiable, as we use it as a Binding to show the full-screen modal.
extension URL: @retroactive Identifiable {
    public var id: String { absoluteString }
}

struct ContentView: View {
    // We need to store the URL of the video on disk. (This comes from Files.)
    @Binding var openedURL: URL?
    
    // Bring in the model context.
    @Environment(\.modelContext) private var modelContext
    
    // The video that is currently selected, if it has been recently played.
    @State private var selectedVideoURL: URL?

    var body: some View {
        NavigationStack {
            VideoListView { item in
                // Validates the URL and assigns it to selectedVideoURL. This happens when a cell in VideoListView is tapped on — opening videos from Files doesn't execute this code. The app starts with selectedVideoURL as nil because it is optional.
                if let url = item.resolveURL() {
                    _ = url.startAccessingSecurityScopedResource()
                    item.dateOpened = .now
                    selectedVideoURL = url
                }
            }
        }
        // Shows the player in a fullScreenCover modality. We need the item initializer to pass in the URL when creating the sheet.
        .fullScreenCover(item: $selectedVideoURL) { url in
            PlayerView(url: url)
        }
        // When the openedURL is changed — either when a user taps a video in the list or opens one from Files — the video is added to the model, and selectedVideoURL is set to that new openedURL. (We get openedURL from videoURL in the Scene.)
        .onChange(of: openedURL) {
            if let openedURL {
                addVideo(from: openedURL)
                selectedVideoURL = openedURL
                self.openedURL = nil
            }
        }
    }
    
    // The addVideo method adds the video to the model.
    private func addVideo(from url: URL) {
        // Validation.
        guard let bookmarkData = try? url.bookmarkData() else { return }

        let name = url.lastPathComponent

        // Remove existing entries with the same name to avoid duplicates.
        let predicate = #Predicate<Video> { $0.name == name }
        if let existing = try? modelContext.fetch(FetchDescriptor(predicate: predicate)) {
            for item in existing {
                modelContext.delete(item)
            }
        }
        
        // Create the Video object and insert it into the model.
        let item = Video(
            name: name,
            bookmarkData: bookmarkData,
            dateOpened: .now
        )
        modelContext.insert(item)
    }
}

#Preview {
    ContentView(openedURL: .constant(nil))
        .modelContainer(for: Video.self, inMemory: true)
}
