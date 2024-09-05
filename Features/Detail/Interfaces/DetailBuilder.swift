

import SwiftUI


@MainActor
public protocol DetailBuilder {
    func view() -> AnyView
}
