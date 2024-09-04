//
//  Workspace.swift
//  AppManifests
//
//  Created by woody on 2022/06/22.
//

import ProjectDescription

let workspace = Workspace(
    name: "Delightroom",
    projects: [
        "App",
        "Features/**",
        "Layers/**",
        "Cores/**",
        "ThirdParties/**",
        "Utils/**"
    ]
)
