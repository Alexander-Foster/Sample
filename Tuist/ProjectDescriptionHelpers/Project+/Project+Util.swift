//
//  Project+Util.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 6/3/24.
//

import ProjectDescription

public extension Project {
    static func util(
        appName: String = "Delightroom",
        name: String,
        baseSettings: SettingsDictionary = [:],
        destinations: Destinations = [.iPhone],
        deploymentTargets: DeploymentTargets = .iOS("16.0"),
        entitlements: Entitlements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Self {
        .init(
            name: name,
            options: .options(
                automaticSchemesOptions: .enabled(codeCoverageEnabled: true, testingOptions: [.parallelizable, .randomExecutionOrdering], testScreenCaptureFormat: .screenshots),
                defaultKnownRegions: ["en", "ko"]
            ),
            settings: .project,
            targets: [
                .target(
                    name: name,
                    destinations: destinations,
                    product: .framework,
                    bundleId: "com.delightroom.\(appName).\(name)",
                    deploymentTargets: deploymentTargets,
                    sources: ["Sources/**"],
                    dependencies: dependencies,
                    settings: .dynamicFramework
                ),
                .target(
                    name: "\(name)Tests",
                    destinations: destinations,
                    product: .unitTests,
                    bundleId: "com.delightroom.\(appName).\(name)Tests",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: [.xctest, .target(name: name), .external(.swiftTesting)],
                    settings: .test
                )
            ]
        )
    }
}


