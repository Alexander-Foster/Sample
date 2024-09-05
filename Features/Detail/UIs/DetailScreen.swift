//
//  DetailScreen.swift
//  DetailUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI

import DetailPresentation
import DesignSystem
import MusicPlayControl

struct DetailScreen: View {
    @EnvironmentObject var playerManager: MusicPlayerManager
    @StateObject private var viewModel: DetailViewModel

    init(
        viewModel: DetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            headerStack
            trackList
        }
        .navigationTitle(viewModel.title)
        .onAppear {
            viewModel.action(.load)
        }
    }
}

// MARK: - Function
extension DetailScreen {

}

// MARK: - UI
extension DetailScreen {

    var headerStack: some View {
        VStack {
            albumInfoStack
            buttonStack
        }
        .padding()
    }

    @ViewBuilder
    var albumInfoStack: some View {
        if let album = viewModel.album {
            HStack(alignment: .top) {
                image(url: album.artworkURL)
                VStack(alignment: .leading) {
                    titleText(album.title)
                    artistText(album.artistName)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    var buttonStack: some View {
        HStack {
            playButton
            shuffleButton
        }
    }

    // TODO: 버튼 스타일 with 디자인 시스템
    var playButton: some View {
        Button(action: {}) {
            Image(systemName: "play.fill")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray4))
        }
    }

    var shuffleButton: some View {
        Button(action: {}) {
            Image(systemName: "shuffle")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray4))
        }
    }

    func image(url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 150)
        } placeholder: {
            Color.gray
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 150)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }


    func titleText(_ value: String) -> some View {
        Text(value)
            .font(.body)
            .bold()
    }

    func artistText(_ value: String) -> some View {
        Text(value)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }

    var trackList: some View {
        ForEach(viewModel.tracks) { track in
            HStack {
                Text("\(track.number ?? -1)")
                Text(track.title)
                Spacer()
            }
            .padding()
            .background(Color(.secondarySystemBackground))
        }
    }
}
