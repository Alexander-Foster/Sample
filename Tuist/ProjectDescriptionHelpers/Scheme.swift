//
//  Scheme.swift
//  ProjectDescriptionHelpers
//
//  Created by Brandan on 2022/04/15.
//

import ProjectDescription


public extension Scheme {
    static func debug(name: String) -> Self {
        .scheme(
            name: "\(name)-Debug",
            shared: true,
            buildAction: BuildAction.buildAction(targets: ["\(name)"]),
            testAction: .targets(
                [
                    TestableTarget.testableTarget(
                        target: TargetReference(stringLiteral: "\(name)Tests"),
                        isParallelizable: true
                    )
                ],
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: "Debug", executable: "\(name)")
        )
    }
    
    static func qa(name: String) -> Self {
        .scheme(
            name: "\(name)-QA",
            shared: true,
            buildAction: BuildAction.buildAction(targets: ["\(name)"]),
            testAction: .targets(
                [
                    TestableTarget.testableTarget(
                        target: TargetReference(stringLiteral: "\(name)Tests"),
                        isParallelizable: true
                    )
                ],
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: "QA", executable: "\(name)")
        )
    }
    
    static func release(name: String) -> Self {
        .scheme(
            name: name,
            shared: true,
            buildAction: BuildAction.buildAction(targets: ["\(name)"]),
            testAction: .targets(
                [
                    TestableTarget.testableTarget(
                        target: TargetReference(stringLiteral: "\(name)Tests"),
                        isParallelizable: true
                    )
                ],
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: "Release", executable: "\(name)")
        )
    }
}
