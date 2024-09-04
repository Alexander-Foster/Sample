// swift-tools-version: 5.9


import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers


let dependencies = PackageSettings(
    productTypes: productTypes,
    baseSettings: .settings(
        configurations: [
            .debug(name: "Debug", settings: [:], xcconfig: nil),
            .debug(name: "QA", settings: [:], xcconfig: nil),
            .release(name: "Release", settings: [:], xcconfig: nil),
        ]
    ),
    targetSettings: [:],
    projectOptions: [:]
)


var productTypes: [String : ProjectDescription.Product] {
    var productTypes = [String : ProjectDescription.Product]()
    allFrameworkNames.map(\.rawValue).forEach { productTypes[$0] = .framework }
    allStaticLibrarayNames.map(\.rawValue).forEach { productTypes[$0] = .staticLibrary }
    allStaticFrameworkNames.map(\.rawValue).forEach { productTypes[$0] = .staticFramework }
    return productTypes
}

var allFrameworkNames: [ExternalModule] {
    [
        .needle,
    ]
}

var allStaticLibrarayNames: [ExternalModule] {
    [
        .swiftTesting,
    ]
}

// Default
var allStaticFrameworkNames: [ExternalModule] {
    [
    ]
}
#endif

let package = Package(
    name: "Package",
    dependencies: [
        .package(url: "https://github.com/uber/needle", .upToNextMajor(from: "0.24.0")),
        .package(url: "https://github.com/apple/swift-testing", .upToNextMajor(from: "0.10.0")),
    ]
)
