import ProjectDescription
import ProjectDescriptionHelpers



let project = Project.feature(
    name: FeatureModule.musicPlayer.rawValue,
    uiDependencies: [
        .core(.designSystem),
        .core(.musicPlayControl)
    ]
)
