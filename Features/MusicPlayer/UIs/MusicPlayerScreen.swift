//
//  MusicPlayerScreen.swift
//  MusicPlayerUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI

import MusicPlayerPresentation
import DesignSystem
import MusicPlayControl


struct MusicPlayerScreen: View {
    @EnvironmentObject var playerManager: MusicPlayerManager
    @StateObject private var viewModel: MusicPlayerViewModel
    @State private var showModal: Bool = false

    init(
        viewModel: MusicPlayerViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        HStack {
            Button(action: playOrPause) {
                Image(systemName: playerManager.isPlaying ? "pause.fill" : "play.fill")
            }
            Spacer()
            if playerManager.isPlaying {
                VStack {
                    Text(playerManager.title)
                        .font(.headline)
                    Text(playerManager.artistName)
                        .font(.subheadline)
                }
            } else {
                Text("재생중인 음악이 없습니다.")
                    .font(.headline)
            }
            Spacer()
            image(url: playerManager.artworkURL)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5)
        .ignoresSafeArea(.all)
        .padding(.horizontal)
        .onTapGesture {
            showModal.toggle()
        }
        .sheet(isPresented: $showModal) {
            MusicPlayerModal()
        }
    }
}

// MARK: - Function
extension MusicPlayerScreen {
    func playOrPause() {
        playerManager.isPlaying ? playerManager.pause() : playerManager.resume()
    }
}

// MARK: - UI
extension MusicPlayerScreen {
    func image(url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 30, height: 30)
        } placeholder: {
            Color.gray
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 30, height: 30)
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .frame(width: 30, height: 30)
    }
}
