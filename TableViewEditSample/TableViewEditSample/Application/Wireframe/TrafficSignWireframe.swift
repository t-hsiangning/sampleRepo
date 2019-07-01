//
//  TrafficSignWireframe.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol TrafficSignWireframe: class {
    var viewController: TrafficSignViewController? { get set }
    func closeViewController(completion: (() -> Void)?)
}

class TrafficSignWireframeImpl: TrafficSignWireframe {
    weak var viewController: TrafficSignViewController?
    
    func closeViewController(completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
}
