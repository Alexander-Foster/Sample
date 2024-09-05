import ProjectDescription
import ProjectDescriptionHelpers



let project = Project.feature(
    name: FeatureModule.detail.rawValue,
    uiDependencies: [
        .core(.designSystem)
    ]
)
