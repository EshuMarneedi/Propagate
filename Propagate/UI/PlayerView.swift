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
        .onDisappear(perform: tearDownPlayer)
        .task { await setUpPlayer() }
    }

    // Activates the audio session and starts playback.
    private func setUpPlayer() async {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.playback, mode: .moviePlayback)
        try? session.setActive(true)

        player = AVPlayer(url: url)
        player?.play()
    }

    // Pauses the player and deactivates the audio session so previous playback can resume.
    private func tearDownPlayer() {
        player?.pause()
        player = nil
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
}
