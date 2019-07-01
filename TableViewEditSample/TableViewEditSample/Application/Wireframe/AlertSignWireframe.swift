//
//  AlertSignWireframe.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol AlertSignWireframe: class {
    var viewController: AlertSignViewController? { get set }
    func closeViewController(completion: (() -> Void)?)
}

class AlertSignWireframeImpl: AlertSignWireframe {
    weak var viewController: AlertSignViewController?
    
    func closeViewController(completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
}
