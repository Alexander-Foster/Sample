

import Cores
import Data
import DetailInterface
import DetailPresentation
import DetailUI
import Domain
import Extensions
import Features
import Foundation
import MainInterface
import MainPresentation
import MainUI
import NeedleFoundation
import Remote
import SwiftUI
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class RepositoryDependency7488f146cdfa18e51394Provider: RepositoryDependency {
    var remoteDataSourceBuilder: RemoteDataSourceBuilder {
        return rootComponent.remoteDataSourceBuilder
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->RepositoryComponent
private func factory89fed910da85ca3e434eb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RepositoryDependency7488f146cdfa18e51394Provider(rootComponent: parent1(component) as! RootComponent)
}
private class UseCaseDependencya6f49ba63a6216781bbbProvider: UseCaseDependency {
    var repositoryBuilder: RepositoryBuilder {
        return rootComponent.repositoryBuilder
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->UseCaseComponent
private func factory53509956f256115531dcb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return UseCaseDependencya6f49ba63a6216781bbbProvider(rootComponent: parent1(component) as! RootComponent)
}
private class RemoteDataSourceDependency523c5d4171d86e4232c5Provider: RemoteDataSourceDependency {


    init() {

    }
}
/// ^->RootComponent->RemoteDataSourceComponent
private func factory36859833a5a11b182947e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RemoteDataSourceDependency523c5d4171d86e4232c5Provider()
}
private class FeatureDependencyda755f4b6b7a1b2ecb3bProvider: FeatureDependency {


    init() {

    }
}
/// ^->RootComponent->FeatureComponent
private func factory740cea5182beb7a7ebb5e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FeatureDependencyda755f4b6b7a1b2ecb3bProvider()
}
private class MainDependency42a1c9e83d0bd7f6ebe1Provider: MainDependency {
    var useCaseBuilder: UseCaseBuilder {
        return rootComponent.useCaseBuilder
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->FeatureComponent->MainComponent
private func factory36ae39c5ea75610257f1a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency42a1c9e83d0bd7f6ebe1Provider(rootComponent: parent2(component) as! RootComponent)
}
private class CoreDependencyceb0ecc352852f9ed5b9Provider: CoreDependency {


    init() {

    }
}
/// ^->RootComponent->CoreComponent
private func factory02d2c52b81982689df00e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CoreDependencyceb0ecc352852f9ed5b9Provider()
}

#else
extension RootComponent: Registration {
    public func registerItems() {


    }
}
extension RepositoryComponent: Registration {
    public func registerItems() {
        keyPathToName[\RepositoryDependency.remoteDataSourceBuilder] = "remoteDataSourceBuilder-RemoteDataSourceBuilder"
    }
}
extension UseCaseComponent: Registration {
    public func registerItems() {
        keyPathToName[\UseCaseDependency.repositoryBuilder] = "repositoryBuilder-RepositoryBuilder"
    }
}
extension RemoteDataSourceComponent: Registration {
    public func registerItems() {

    }
}
extension FeatureComponent: Registration {
    public func registerItems() {

        localTable["mainBuilder-MainBuilder"] = { [unowned self] in self.mainBuilder as Any }
    }
}
extension MainComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainDependency.useCaseBuilder] = "useCaseBuilder-UseCaseBuilder"
    }
}
extension CoreComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->RepositoryComponent", factory89fed910da85ca3e434eb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->UseCaseComponent", factory53509956f256115531dcb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->RemoteDataSourceComponent", factory36859833a5a11b182947e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->FeatureComponent", factory740cea5182beb7a7ebb5e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->FeatureComponent->MainComponent", factory36ae39c5ea75610257f1a9403e3301bb54f80df0)
    registerProviderFactory("^->RootComponent->CoreComponent", factory02d2c52b81982689df00e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
