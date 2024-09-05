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
            VStack {

            }
            .navigationTitle("라이브러리")
            .onAppear {
                viewModel.action(.load)
            }
        }
    }
}

// MARK: - Function
extension MainScreen {


}

// MARK: - UI
extension MainScreen {

}
