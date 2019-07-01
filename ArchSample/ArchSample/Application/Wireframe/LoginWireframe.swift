//
//  LoginWireframe.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol LoginWireframe: class {
    var viewController: LoginViewController? { get set }
    
    func closeViewController(completion: (() -> Void)?)
}

class LoginWireframeImpl: LoginWireframe {
    
    weak var viewController: LoginViewController?
    var wireframe: RootWireframe?
    
    func closeViewController(completion: (() -> Void)? = nil) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
}
