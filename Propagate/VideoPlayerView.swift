//
//  VideoPlayerView.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import AVFoundation
import AVKit
import SwiftUI

struct VideoPlayerView: View {
    let url: URL
    @Environment(\.dismiss) private var dismiss
    @State private var player: AVPlayer?

    var body: some View {
        // Displays the player.
        ZStack {
            if let player {
                PlayerView(player: player)
                    .ignoresSafeArea()
            } else {
                Color.black.ignoresSafeArea()
            }
        }
        .persistentSystemOverlays(.hidden)
        .task {
            // Activate the audio session only when a video is opened, so we don't interrupt background audio on app launch.
            let session = AVAudioSession.sharedInstance()
            try? session.setCategory(.playback, mode: .moviePlayback)
            try? session.setActive(true)
            
            // Create the player for the video. (This has no UI — the UI is PlayerView, which requires an AVPlayer object.)
            let newPlayer = AVPlayer(url: url)
            player = newPlayer
            newPlayer.play()
        }
    }
}
