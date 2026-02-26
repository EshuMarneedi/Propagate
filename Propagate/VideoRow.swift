//
//  VideoRow.swift
//  Propagate
//

import SwiftUI

struct VideoRow: View {
    let item: VideoHistoryItem

    var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text(item.name)

                Text(item.dateOpened, format: .relative(presentation: .named))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: "film")
        }
    }
}
