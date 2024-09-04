//
//  ImageLoader.swift
//  DesignSystem
//
//  Created by Chang Woo Son on 8/7/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cache = NSCache<NSURL, UIImage>()
    private var cancellable: AnyCancellable?

    func load(from url: URL?) {
        guard let url else { return }
        if let cachedImage = cache.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] downloadedImage in
                guard let self = self else { return }
                if let image = downloadedImage {
                    self.cache.setObject(image, forKey: url as NSURL)
                }
                self.image = downloadedImage
            }
    }

    func cancel() {
        cancellable?.cancel()
    }

    deinit {
        cancellable?.cancel()
    }
}
