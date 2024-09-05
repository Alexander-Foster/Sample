import ProjectDescription
import ProjectDescriptionHelpers



let project = Project.staticLibrary(
    name: "Cores",
    deploymentTargets: .iOS("16.0"),
    dependencies: [
        .core(.designSystem),
        .core(.network)
    ]
)
