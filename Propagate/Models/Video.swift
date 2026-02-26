//
//  Video.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import Foundation
import SwiftData

// This SwiftData model stores a video in memory.
@Model
final class Video {
    #Unique<Video>([\.name])

    var name: String
    var bookmarkData: Data
    var dateOpened: Date

    init(name: String, bookmarkData: Data, dateOpened: Date) {
        self.name = name
        self.bookmarkData = bookmarkData
        self.dateOpened = dateOpened
    }

    // Resolves the security-scoped URL from stored bookmark data, refreshing the bookmark if it has become stale.
    func resolveURL() -> URL? {
        var isStale = false
        guard let url = try? URL(
            resolvingBookmarkData: bookmarkData,
            bookmarkDataIsStale: &isStale
        ) else { return nil }

        if isStale, let newBookmarkData = try? url.bookmarkData() {
            self.bookmarkData = newBookmarkData
        }

        return url
    }
}
