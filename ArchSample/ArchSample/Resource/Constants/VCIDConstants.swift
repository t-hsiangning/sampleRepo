//
//  VCIDConstants.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

enum VCIDConstants {
    case root
    case login
    
    public var identity: String {
        switch self {
        case .root: return "RootViewController"
        case .login: return "LoginViewController"
        }
    }
}
