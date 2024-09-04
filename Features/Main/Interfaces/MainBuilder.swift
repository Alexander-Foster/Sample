

import SwiftUI


@MainActor
public protocol MainBuilder {
    func view() -> AnyView
}
