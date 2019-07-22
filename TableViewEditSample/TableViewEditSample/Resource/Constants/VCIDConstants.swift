//
//  VCIDConstants.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

enum VCIDConstants {
    case root
    case roadSign
    case alertSign
    case trafficSign
    case alertSignNavigation
    case trafficSignNavigation
    case alertShow
    
    public var identity: String {
        switch self {
        case .root: return "RootViewController"
        case .roadSign: return "RoadSignViewController"
        case .alertSign: return "AlertSignViewController"
        case .trafficSign: return "TrafficSignViewController"
        case .alertSignNavigation: return "AlertSignNavigationController"
        case .trafficSignNavigation: return "TrafficSignNavigationController"
        case .alertShow: return "AertShowViewController"
        }
    }
}
