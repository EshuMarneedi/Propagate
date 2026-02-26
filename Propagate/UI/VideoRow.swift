//
//  VideoRow.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import SwiftUI

struct VideoRow: View {
    let item: Video

    var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text(item.name)
            }
        } icon: {
            Image(systemName: "film")
        }
    }
}
