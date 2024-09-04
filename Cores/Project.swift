import ProjectDescription
import ProjectDescriptionHelpers



let project = Project.staticLibrary(
    name: "Cores",
    deploymentTargets: .iOS("15.0"),
    dependencies: [
        .core(.designSystem),
        .core(.network)
    ]
)
