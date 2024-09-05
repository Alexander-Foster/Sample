//
//  RemoteDataSourceBuilder.swift
//  Remote
//
//  Created by Chang Woo Son on 5/3/24.
//

import Foundation

import NeedleFoundation

import Data

public protocol RemoteDataSourceDependency: Dependency {
    
}

public class RemoteDataSourceComponent: Component<RemoteDataSourceDependency>, RemoteDataSourceBuilder {
    
    public var musicDataSource: MusicDataSource {
        shared {
            MusicDataSourceImpl()
        }
    }
}
