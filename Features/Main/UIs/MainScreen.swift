//
//  MainScreen.swift
//  MainUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI

import MainPresentation
import DesignSystem

struct MainScreen: View {
    @StateObject private var viewModel: MainViewModel

    init(
        viewModel: MainViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
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
        AlbumCard(album: album)
    }
}
