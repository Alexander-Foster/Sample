//
//  MainScreen.swift
//  MainUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI
import MusicKit

import MainPresentation
import DesignSystem

struct MainScreen: View {
    @State private var musicAuthStatus = MusicAuthorization.Status.notDetermined
    @State private var songs: [Album] = []

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
        }
    }
}

// MARK: - Function
extension MainScreen {


}

// MARK: - UI
extension MainScreen {

}
