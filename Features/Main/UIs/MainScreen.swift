//
//  MainScreen.swift
//  MainUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI

import MainPresentation
import DetailInterface
import DesignSystem

struct MainScreen: View {
    @StateObject private var viewModel: MainViewModel

    private let detailBuilder: DetailBuilder

    init(
        viewModel: MainViewModel,
        detailBuilder: DetailBuilder
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.detailBuilder = detailBuilder
    }

    var body: some View {
        NavigationView {
            scrollView
                .navigationTitle("라이브러리")
                .onAppear(perform: load)
        }
    }
}

// MARK: - Function
extension MainScreen {
    func load() {
        viewModel.action(.load)
    }
}

// MARK: - UI
extension MainScreen {
    var scrollView: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: 2),
                spacing: 16
            ) {
                ForEach(viewModel.albums) {
                    albumCard($0)
                }
            }
            .padding()
        }
    }

    func albumCard(_ album: Album) -> some View {
        NavigationLink(destination: { detailBuilder.view() }) {
            AlbumCard(album: album)
        }
    }
}
