import ProjectDescription
import ProjectDescriptionHelpers



let project = Project.feature(
    name: FeatureModule.main.rawValue,
    uiDependencies: [
        .core(.designSystem)
    ]
)
