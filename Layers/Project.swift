//
//  Project.swift
//  Packages
//
//  Created by Chang Woo Son on 4/29/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.staticLibrary(
    name: "Layers",
    deploymentTargets: .iOS("16.0"),
    dependencies: [
        .layer(.data),
        .layer(.domain),
        .layer(.remote),
    ]
)
