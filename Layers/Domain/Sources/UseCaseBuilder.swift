//
//  UseCaseBuilder.swift
//  Domain
//
//  Created by Chang Woo Son on 5/3/24.
//

import Foundation

import NeedleFoundation


public protocol UseCaseDependency: Dependency {
    var repositoryBuilder: RepositoryBuilder { get }
}

public protocol UseCaseBuilder {
    var useCase: UseCase { get }
}

public class UseCaseComponent: Component<UseCaseDependency>, UseCaseBuilder {

    public var useCase: UseCase {
        shared {
            UseCase(repository: dependency.repositoryBuilder.repository)
        }
    }
}

