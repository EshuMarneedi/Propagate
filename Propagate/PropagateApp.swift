//
//  PropagateApp.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//

import SwiftData
import SwiftUI

@main
struct PropagateApp: App {
    @State private var videoURL: URL?

    var body: some Scene {
        WindowGroup {
            ContentView(openedURL: $videoURL)
                // When the app is given a URL, set the videoURL to that URL. We pass this URL to the video player.
                .onOpenURL { url in
                    _ = url.startAccessingSecurityScopedResource()
                    videoURL = url
                }
        }
        // Inject the model container into the view.
        .modelContainer(for: VideoHistoryItem.self)
    }
}
