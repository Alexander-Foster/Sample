//
//  Project.swift
//  Packages
//
//  Created by Chang Woo Son on 4/29/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.layer(
    name: LayerModule.remote.rawValue,
    dependencies: [
        .core(.network),
        .layer(.data),
        .sdk(name: "MusicKit", type: .framework, status: .required)
    ]
)
