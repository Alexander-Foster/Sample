

import SwiftUI


@MainActor
public protocol DetailBuilder {
    func view(albumId: String) -> AnyView
}
