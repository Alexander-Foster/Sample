//
//  Project+ThirdParty.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 6/3/24.
//

import ProjectDescription


public extension Project {
    static func thirdParty(
        appName: String = "Delightroom",
        name: String,
        baseSettings: SettingsDictionary = [:],
        destinations: Destinations = [.iPhone],
        deploymentTargets: DeploymentTargets = .iOS("15.0"),
        entitlements: Entitlements? = nil,
        dependencies: [TargetDependency] = [],
        testDependencies: [TargetDependency] = []
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
                    settings: .dynamicFramework
                ),
                .target(
                    name: name,
                    destinations: destinations,
                    product: .staticLibrary,
                    bundleId: "com.delightroom.\(appName).\(name)",
                    deploymentTargets: deploymentTargets,
                    sources: ["Sources/**"],
                    dependencies:
                        dependencies + [.external(name: "NeedleFoundation"), .target(name: "\(name)Interface")],
                    settings: .staticLibrary
                ),
                .target(
                    name: "\(name)Tests",
                    destinations: destinations,
                    product: .unitTests,
                    bundleId: "com.delightroom.\(appName).\(name)Tests",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: testDependencies + [.xctest, .target(name: name), .external(.swiftTesting)],
                    settings: .test
                )
            ]
        )
    }
}



