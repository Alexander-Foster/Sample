//
//  RootComponent.swift
//  Delight Room
//
//  Created by Chang Woo Son on 2023/09/24.
//

import SwiftUI

import NeedleFoundation

import Features
import Cores
import Domain
import Data
import Remote


final class RootComponent: BootstrapComponent {
    
    var featureBuilder: FeatureBuilder {
        shared {
            FeatureComponent(parent: self)
        }
    }
    
    var coreBuilder: CoreBuilder {
        shared {
            CoreComponent(parent: self)
        }
    }

    @MainActor
    var rootView: some View {
        featureBuilder.mainBuilder.view()
    }
}

extension RootComponent {
    var useCaseBuilder: UseCaseBuilder {
        shared {
            UseCaseComponent(parent: self)
        }
    }

    var repositoryBuilder: RepositoryBuilder {
        shared {
            RepositoryComponent(parent: self)
        }
    }

    var remoteDataSourceBuilder: RemoteDataSourceBuilder {
        shared {
            RemoteDataSourceComponent(parent: self)
        }
    }
}
