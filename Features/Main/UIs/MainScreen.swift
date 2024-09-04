//
//  MainScreen.swift
//  MainUI
//
//  Created by Chang Woo Son on 3/14/24.
//

import SwiftUI

import DetailInterface
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
        }
    }
}

// MARK: - Function
extension MainScreen {

}

// MARK: - UI
extension MainScreen {
    
}
