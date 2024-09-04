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


public protocol FeatureDependency: Dependency {
    
}

public protocol FeatureBuilder {
    var mainBuilder: MainBuilder { get }
}

public final class FeatureComponent: Component<FeatureDependency>, FeatureBuilder {

    public var mainBuilder: MainBuilder {
        MainComponent(parent: self)
    }
}
