//
//  RepositoryComponent.swift
//  Data
//
//  Created by Chang Woo Son on 5/3/24.
//

import Foundation

import NeedleFoundation

import Domain


public protocol RepositoryDependency: Dependency {
    var remoteDataSourceBuilder: RemoteDataSourceBuilder { get }
}

public class RepositoryComponent: Component<RepositoryDependency>, RepositoryBuilder {
    
    public var musicRepository: MusicRepository {
        shared {
            MusicRepositoryImpl(dataSource: dependency.remoteDataSourceBuilder.musicDataSource)
        }
    }
}
