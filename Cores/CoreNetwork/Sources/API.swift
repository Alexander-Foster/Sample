//
//  API.swift
//  Network
//
//  Created by Chang Woo Son on 6/20/24.
//

import Foundation


public protocol APIConfigure {
    var host: String { get }
    var basePath: String { get }
}

extension APIConfigure {
    var baseURL: URL {
        URL(string: "\(host)/\(basePath)")!
    }
}


public struct API {
    internal struct Configure {
        var configure: APIConfigure
        var baseURL: URL { configure.baseURL }
    }

    internal static var configure: Configure!


    public static func configure(
        _ configure: APIConfigure
    ) {
        Self.configure = Configure(configure: configure)
    }
}
