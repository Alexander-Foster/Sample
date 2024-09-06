//
//  MusicPlayerModal.swift
//  MusicPlayerUI
//
//  Created by Chang Woo Son on 9/5/24.
//

import SwiftUI

import DesignSystem
import MusicPlayControl

struct MusicPlayerModal: View {
    @EnvironmentObject var playerManager: MusicPlayerManager


    var body: some View {
        VStack {
            Text(playerManager.title)
                .font(.headline)
            Text(playerManager.artistName)
                .font(.subheadline)

            Spacer()
            image(url: playerManager.artworkURL)

            Spacer()

            HStack {
                Spacer()
                Button(action: {
                    playerManager.toggleRepeatMode()
                }) {
                    Image(systemName: playerManager.repeatMode == .one ? "repeat.1" : "repeat")
                        .tint(playerManager.repeatMode == nil ? .gray : .accentColor)
                }
                Spacer()

                Button(action: {
                    Task {
                        await playerManager.previous()
                    }
                }) {
                    Image(systemName: "backward.fill")
                }
                Spacer()
                Button(action: {
                    playerManager.isPlaying ? playerManager.pause() : playerManager.resume()
                }) {
                    Image(systemName: playerManager.isPlaying ? "pause.fill" : "play.fill")
                }
                Spacer()
                Button(action: {
                    Task {
                        await playerManager.next()
                    }
                }) {
                    Image(systemName: "forward.fill")
                }
                Spacer()
                Button(action: {
                    playerManager.toggleShuffled()
                }) {
                    Image(systemName: "shuffle")
                        .tint(playerManager.isShuffled ? .accentColor : .gray)
                }
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }


    func image(url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 400, height: 400)
        } placeholder: {
            Color.gray
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 400, height: 400)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
