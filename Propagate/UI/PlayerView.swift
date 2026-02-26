//
//  PlayerView.swift
//  Propagate
//
//  Created by Eshu Marneedi on 2/25/26.
//  Copyright © 2026 Eshu Marneedi. All rights reserved.
//

import AVFoundation
import AVKit
import SwiftUI

struct PlayerView: View {
    let url: URL
    @Environment(\.dismiss) private var dismiss
    @State private var player: AVPlayer?
    
    var body: some View {
        // Displays the player.
        ZStack {
            if let player {
                Player(player: player)
                    .ignoresSafeArea()
            } else {
                // This displays as the player is being created.
                ProgressView()
            }
        }
        .persistentSystemOverlays(.hidden)
        // When the video is closed, deactivate the audio session and tell the system to resume previous playback.
        .onDisappear {
            player?.pause()
            player = nil
            try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        }
        .task {
            // Activate the audio session only when a video is opened, so we don't interrupt background audio on app launch.
            let session = AVAudioSession.sharedInstance()
            try? session.setCategory(.playback, mode: .moviePlayback)
            try? session.setActive(true)
            
            // Create the AVPlayer for the video with the URL, then tell it to play. (This has no UI — the UI is Player, which requires an AVPlayer object.)
            player = AVPlayer(url: url)
            player?.play()
        }
    }
}
