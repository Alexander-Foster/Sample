//
//  FeatureBuilder.swift
//  Features
//
//  Created by Chang Woo Son on 3/10/24.
//

import SwiftUI

import NeedleFoundation

import MainInterface
import MainUI
import DetailInterface
import DetailUI
import MusicPlayerInterface
import MusicPlayerUI


public protocol FeatureDependency: Dependency {
    
}

public protocol FeatureBuilder {
    var mainBuilder: MainBuilder { get }
    var detailBuilder: DetailBuilder { get }
    var musicPlayerBuilder: MusicPlayerBuilder { get }
}

public final class FeatureComponent: Component<FeatureDependency>, FeatureBuilder {

    public var mainBuilder: MainBuilder {
        MainComponent(parent: self)
    }

    public var detailBuilder: DetailBuilder {
        DetailComponent(parent: self)
    }

    public var musicPlayerBuilder: MusicPlayerBuilder {
        MusicPlayerComponent(parent: self)
    }
}
