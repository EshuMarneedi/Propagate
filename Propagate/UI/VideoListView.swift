//
//  VideoListView.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import SwiftData
import SwiftUI

struct VideoListView: View {
    // Query the model for all video history items.
    @Query(sort: \VideoHistoryItem.dateOpened, order: .reverse) private var items: [VideoHistoryItem]
    
    // Bring in the model context.
    @Environment(\.modelContext) private var modelContext

    var onSelect: (VideoHistoryItem) -> Void

    var body: some View {
        Group {
            // Show if no items are in the model context.
            if items.isEmpty {
                ContentUnavailableView(
                    "No Videos",
                    systemImage: "film",
                    description: Text("Open a video from the Files app to get started.")
                )
            } else {
                // Show the items in a list, with VideoRow being used for formatting.
                List {
                    ForEach(items) { item in
                        Button {
                            onSelect(item)
                        } label: {
                            VideoRow(item: item)
                        }
                    }
                    // Delete the items using a swipe gesture.
                    .onDelete { offsets in
                        for index in offsets {
                            modelContext.delete(items[index])
                        }
                    }
                }
            }
        }
        .navigationTitle("Propagate")
    }
}
