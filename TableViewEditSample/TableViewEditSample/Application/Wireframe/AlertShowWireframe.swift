//
//  AlertShowWireframe.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol AlertShowWireframe: class {
    var viewController: AlertShowViewController? { get set }
    func closeViewController(completion: (() -> Void)?)
}

class AlertShowWireframeImpl: AlertShowWireframe {
    weak var viewController: AlertShowViewController?
    
    func closeViewController(completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
}
