//
//  IdentifiableURL.swift
//  Propagate
//
//  Created by Eshu Marneedi on 3/7/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import Foundation

// Makes the URL identifable. 
struct IdentifiableURL: Identifiable {
    let url: URL
    var id: String { url.absoluteString }
}
