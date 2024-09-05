import ProjectDescription
import ProjectDescriptionHelpers



let project = Project.staticLibrary(
    name: "Features",
    deploymentTargets: .iOS("16.0"),
    dependencies: [
        .feature(ui: .main),
        .feature(interface: .main)
    ]
)
