//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by woody on 2022/02/18.
//

import ProjectDescription
import ProjectDescriptionHelpers

public extension Project {
    static func app(
        name: String,
        packages: [Package] = [],
        infoPlist: InfoPlist,
        scripts: [TargetScript] = [],
        entitlements: Entitlements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Self {
        app(
            name: name,
            packages: packages,
            settings: .project,
            product: .app,
            infoPlist: infoPlist,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies
        )
    }
    
    static func dynamicFramework(
        name: String,
        packages: [Package] = [],
        deploymentTargets: DeploymentTargets?,
        infoPlist: InfoPlist = .default,
        dependencies: [TargetDependency] = [],
        includesExample: Bool = false
    ) -> Self {
        module(
            name: name,
            packages: packages,
            settings: .project,
            product: .framework,
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            dependencies: dependencies,
            includesExample: includesExample
        )
    }
    
    static func staticLibrary(
        name: String,
        packages: [Package] = [],
        baseSettings: SettingsDictionary = [:],
        deploymentTargets: DeploymentTargets?,
        infoPlist: InfoPlist = .default,
        dependencies: [TargetDependency] = [],
        includesExample: Bool = false
    ) -> Self {
        module(
            name: name,
            packages: packages,
            settings: .project,
            product: .staticLibrary,
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            dependencies: dependencies,
            includesExample: includesExample
        )
    }
}

private extension Project {
    static func app(
        name: String,
        packages: [Package],
        settings: Settings? = nil,
        product: Product,
        infoPlist: InfoPlist,
        entitlements: Entitlements? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = []
    ) -> Self {
        .init(
            name: name,
            packages: packages,
            settings: settings,
            targets: appTargets(
                name: name,
                product: product,
                infoPlist: infoPlist,
                entitlements: entitlements,
                scripts: scripts,
                dependencies: dependencies
            ),
            schemes: [
                .debug(name: "\(name)"),
                .qa(name: "\(name)"),
                .release(name: "\(name)"),
            ]
        )
    }
    
    static func module(
        name: String,
        packages: [Package],
        settings: Settings? = nil,
        product: Product,
        deploymentTargets: DeploymentTargets?,
        infoPlist: InfoPlist,
        entitlements: Entitlements? = nil,
        dependencies: [TargetDependency],
        includesExample: Bool = false
    ) -> Self {
        .init(
            name: name,
            packages: packages,
            settings: settings,
            targets: targets(
                name: name,
                product: product,
                deploymentTargets: deploymentTargets,
                infoPlist: infoPlist,
                entitlements: entitlements,
                dependencies: dependencies,
                includesExample: includesExample
            ),
            schemes: [
                .debug(name: name),
                .qa(name: name),
                .release(name: name)
            ]
        )
    }
    
    static func appTargets(
        name: String,
        product: Product,
        infoPlist: InfoPlist,
        entitlements: Entitlements?,
        scripts: [TargetScript],
        dependencies: [TargetDependency] = []
    ) -> [Target] {
        [
            .iOS(
                name: name,
                infoPlist: infoPlist,
                entitlements: entitlements,
                scripts: scripts,
                dependencies: dependencies
            ),
            .test(name: name, product: product)
        ]
    }
    
    static func targets(
        name: String,
        product: Product,
        deploymentTargets: DeploymentTargets?,
        infoPlist: InfoPlist,
        entitlements: Entitlements?,
        dependencies: [TargetDependency],
        includesExample: Bool
    ) -> [Target] {
        var targets: [Target] = [
            .main(
                name: name,
                product: product,
                deploymentTargets: deploymentTargets,
                infoPlist: infoPlist,
                entitlements: entitlements,
                dependencies: dependencies
            ),
            .test(name: name, product: product, includesExample: includesExample)
        ]
        
        if includesExample {
            targets.append(.example(name: name))
        }
        
        return targets
    }
}


