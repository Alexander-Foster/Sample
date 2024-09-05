//
//  AlbumCard.swift
//  MainInterface
//
//  Created by Chang Woo Son on 9/5/24.
//

import SwiftUI
import MainPresentation

struct AlbumCard: View {
    let album: Album

    var body: some View {
        VStack(spacing: 12) {
            image
            titleText
                .padding(.horizontal, 12)
            artistText
                .padding([.bottom, .horizontal], 12)
        }
        .frame(maxWidth: .infinity)
        .background(
            Color(.secondarySystemBackground)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

private extension AlbumCard {
    var image: some View {
        AsyncImage(url: album.artworkURL) { image in
            image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(maxWidth: .infinity)
        } placeholder: {
            Color.gray
                .aspectRatio(1, contentMode: .fill)
                .frame(maxWidth: .infinity)
        }
    }

    var titleText: some View {
        Text(album.title)
            .lineLimit(1)
            .font(.headline)
    }

    var artistText: some View {
        Text(album.artistName)
            .lineLimit(1)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}
