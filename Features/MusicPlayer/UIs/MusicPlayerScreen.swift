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

    init(
        viewModel: MusicPlayerViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        HStack {
            Button(action: { }) {
                Image(systemName: "pause.fill")
            }
            Spacer()
            Text("재생중인 음악이 없습니다.")
                .font(.headline)
            Spacer()
            Text("이미지영역")
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5)
        .ignoresSafeArea(.all)
        .padding(.horizontal)
    }
}

// MARK: - Function
extension MusicPlayerScreen {

}

// MARK: - UI
extension MusicPlayerScreen {

}
