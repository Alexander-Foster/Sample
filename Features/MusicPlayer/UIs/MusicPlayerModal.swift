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

                }) {
                    Image(systemName: "repeat")
                }
                .disabled(true)
                Spacer()

                Button(action: {
                    playerManager.previous()
                }) {
                    Image(systemName: "backward.fill")
                }
                Spacer()
                Button(action: {
                    playerManager.isPlaying ? playerManager.pause() : playerManager.resume()
                }) {
                    Image(systemName: "play.fill")
                }
                Spacer()
                Button(action: {
                    playerManager.next()
                }) {
                    Image(systemName: "forward.fill")
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "shuffle")
                }
                .disabled(true)
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
