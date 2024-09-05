//
//  Project+Feature.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 3/10/24.
//

import Foundation
import ProjectDescription


public extension Project {
    static func feature(
        appName: String = "Delightroom",
        name: String,
        baseSettings: SettingsDictionary = [:],
        destinations: Destinations = [.iPhone],
        deploymentTargets: DeploymentTargets = .iOS("16.0"),
        interfaceDependencies: [TargetDependency] = [],
        uiDependencies: [TargetDependency] = [],
        presentationDependencies: [TargetDependency] = [],
        testingOnlyDependencies: [TargetDependency] = [],
        testOnlyDependencies: [TargetDependency] = []
    ) -> Self {
        .init(
            name: name,
            options: .options(
                automaticSchemesOptions: .enabled(codeCoverageEnabled: true, testingOptions: [.parallelizable, .randomExecutionOrdering], testScreenCaptureFormat: .screenshots),
                defaultKnownRegions: ["en", "ko"]
            ),
            settings: .project,
            targets: [
                // Interface
                .target(
                    name: "\(name)Interface",
                    destinations: destinations,
                    product: .framework,
                    bundleId: "com.delightroom.\(appName).\(name).interface",
                    deploymentTargets: deploymentTargets,
                    sources: ["Interfaces/**"],
                    dependencies: interfaceDependencies
                ),
                // UI Layer
                .target(
                    name: "\(name)UI",
                    destinations: destinations,
                    product: .framework,
                    bundleId: "com.delightroom.\(appName).\(name)",
                    deploymentTargets: deploymentTargets,
                    sources: ["UIs/**"],
                    resources: ["Resources/**"],
                    dependencies:
                        uiDependencies +
                        [.external(name: "NeedleFoundation"), .target(name: "\(name)Interface"), .target(name: "\(name)Presentation")],
                    settings: .dynamicFramework
                ),
                // Presentation Layer
                .target(
                    name: "\(name)Presentation",
                    destinations: destinations,
                    product: .staticLibrary,
                    bundleId: "com.delightroom.\(appName).\(name).presentation",
                    deploymentTargets: deploymentTargets,
                    sources: ["Presentations/**"],
                    dependencies: presentationDependencies + [.layer(.domain)],
                    settings: .staticLibrary
                ),
                // Testing
                .target(
                    name: "\(name)Testing",
                    destinations: destinations,
                    product: .staticLibrary,
                    bundleId: "com.delightroom.\(appName).\(name).testing",
                    sources: ["Testings/**"],
                    dependencies: testingOnlyDependencies + [.target(name: "\(name)Interface")],
                    settings: .staticLibrary
                ),
                // Test
                .target(
                    name: "\(name)Tests",
                    destinations: destinations,
                    product: .unitTests,
                    bundleId: "com.delightroom.\(appName).\(name)Tests",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: testOnlyDependencies + [.xctest, .target(name: "\(name)Testing"), .external(.swiftTesting)],
                    settings: .test
                )
            ]
        )
    }
}
