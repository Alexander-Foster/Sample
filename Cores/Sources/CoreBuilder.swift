//
//  CoreBuilder.swift
//  Cores
//
//  Created by Chang Woo Son on 3/10/24.
//

import SwiftUI


import NeedleFoundation


public protocol CoreDependency: Dependency {
    
}

public protocol CoreBuilder {
    
}

public final class CoreComponent: Component<CoreDependency>, CoreBuilder {
    
}
