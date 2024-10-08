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
    var getAllAlbumUseCase: GetAllAlbumUseCase { get }
    var getAlbumDetailUseCase: GetAlbumDetailUseCase { get }
}

public class UseCaseComponent: Component<UseCaseDependency>, UseCaseBuilder {

    public var getAllAlbumUseCase: GetAllAlbumUseCase {
        shared {
            GetAllAlbumUseCase(repository: dependency.repositoryBuilder.musicRepository)
        }
    }

    public var getAlbumDetailUseCase: GetAlbumDetailUseCase {
        shared {
            GetAlbumDetailUseCase(repository: dependency.repositoryBuilder.musicRepository)
        }
    }
}

