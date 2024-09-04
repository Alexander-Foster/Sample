//
//  Configuration+.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 3/28/24.
//

import Foundation
import ProjectDescription


public extension Configuration {
    struct App {
        static let iOS: [Configuration] = [
            .debug(name: "Debug", settings: SettingsDictionary.App.debugMode.merging(.iOS.debug)),
            .debug(name: "QA", settings: SettingsDictionary.App.debugMode.merging(.iOS.qa)),
            .release(name: "Release", settings: SettingsDictionary.App.releaseMode.merging(.iOS.release)),
        ]
    }

    static let project: [Configuration] = [
        .debug(name: "Debug", settings: .debug),
        .debug(name: "QA", settings: .qa),
        .release(name: "Release", settings: .release),
    ]

    static let dynamicFramework: [Configuration] = [
        .debug(name: "Debug", settings: .dynamicFramework),
        .debug(name: "QA", settings: .dynamicFramework),
        .release(name: "Release", settings: .dynamicFramework)
    ]

    static let staticLibrary: [Configuration] = [
        .debug(name: "Debug", settings: .staticLibrary),
        .debug(name: "QA", settings: .staticLibrary),
        .release(name: "Release", settings: .staticLibrary)
    ]

    static let test: [Configuration] = [
        .debug(name: "Debug", settings: .test),
        .debug(name: "QA", settings: .test),
        .release(name: "Release", settings: .test)
    ]

    static let example: [Configuration] = [
        .debug(name: "Debug", settings: .example),
        .release(name: "Release", settings: .example)
    ]
}
