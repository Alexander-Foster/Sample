//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 5/22/24.
//

import ProjectDescription
import ProjectDescriptionHelpers


let project = Project.staticLibrary(
    name: "ThirdParties",
    deploymentTargets: .iOS("16.0"),
    dependencies: [
    ]
)
