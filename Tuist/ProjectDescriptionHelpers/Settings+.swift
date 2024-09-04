//
//  Settings+.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 3/28/24.
//

import Foundation
import ProjectDescription


public extension Settings {
    static let project: Self = .settings(
        base: .base,
        configurations: Configuration.project
    )
    
    static let dynamicFramework: Self = .settings(
        base: .base,
        configurations: Configuration.dynamicFramework
    )

    static let staticLibrary: Self = .settings(
        base: .base,
        configurations: Configuration.staticLibrary
    )

    static let test: Self = .settings(
        base: .base,
        configurations: Configuration.test
    )

    static let exampleApp: Self = .settings(
        configurations: Configuration.example
    )

    static let iOS: Self = .settings(
        base: .App.base,
        configurations: Configuration.App.iOS
    )
}
