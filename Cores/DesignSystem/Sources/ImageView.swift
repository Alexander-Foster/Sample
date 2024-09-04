//
//  ImageView.swift
//  DesignSystem
//
//  Created by Chang Woo Son on 8/7/24.
//

import SwiftUI
import Combine


public struct ImageView: View {
    @StateObject private var loader = ImageLoader()
    private let url: URL?
    private let placeholder: Image

    public init(with url: URL?, placeholder: Image = Image(systemName: "photo")) {
        self.url = url
        self.placeholder = placeholder
    }

    public var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                placeholder
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .onAppear {
            loader.load(from: url)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}
