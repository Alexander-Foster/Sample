//
//  Project.swift
//  iOSApp
//
//  Created by Son Chagnwoo on 2022/04/11.
//

import ProjectDescription
import ProjectDescriptionHelpers


let project = Project.app(
    name: "Delightroom",
    infoPlist: .delightroom,
    dependencies: [
        .external(.needle),
        .features,
        .cores,
        .layers,
        .thirdParties,
        .utils
    ]
)
