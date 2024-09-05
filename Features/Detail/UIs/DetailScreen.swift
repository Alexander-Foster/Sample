//
//  DetailScreen.swift
//  DetailUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI

import DetailPresentation
import DesignSystem

struct DetailScreen: View {
    @StateObject private var viewModel: DetailViewModel

    init(
        viewModel: DetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Detail")
            .navigationTitle("라이브러리")
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

}
