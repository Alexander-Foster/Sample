//
//  Target.swift
//  ProjectDescriptionHelpers
//
//  Created by Brandan on 2022/02/18.
//

import ProjectDescription


public extension Target {
    static func iOS(
        name: String,
        infoPlist: InfoPlist,
        entitlements: Entitlements?,
        scripts: [TargetScript],
        dependencies: [TargetDependency]
    ) -> Self {
        .target(
            name: name,
            destinations: [.iPhone],
            product: .app,
            bundleId: "${PRODUCT_BUNDLE_IDENTIFIER}",
            deploymentTargets: .iOS("16.0"),
            infoPlist: infoPlist,
            sources: [
                "Sources/iOS/**",
                "Sources/Common/**"
            ],
            resources: [
                "Resources/iOS/**",
                "Resources/Common/**",
            ],
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: .iOS
        )
    }
    
    static func main(
        name: String,
        product: Product,
        deploymentTargets: DeploymentTargets? = nil,
        infoPlist: InfoPlist,
        entitlements: Entitlements?,
        dependencies: [TargetDependency]
    ) -> Self {
        .target(
            name: name,
            destinations: [.iPhone],
            product: product,
            bundleId: "com.delightroom.\(name)",
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            entitlements: entitlements,
            dependencies: dependencies,
            settings: product == .framework ? .dynamicFramework : .staticLibrary
        )
    }
    
    static func test(
        name: String,
        product: Product,
        includesExample: Bool = false
    ) -> Self {
        return .target(
            name: "\(name)Tests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "com.delightroom.\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.xctest, .target(name: name)],
            settings: .test
        )
    }
    
    static func example(name: String) -> Self {
        .target(
            name: "\(name)Example",
            destinations: [.iPhone],
            product: .app,
            bundleId: "com.delightroom.\(name)Example",
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [.target(name: name)],
            settings: .exampleApp
        )
    }
}
