//
//  RootWireframe.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol RootWireframe: class {
    var viewController: RootViewController? { get set }
    func openLoginViewController()
    func dismiss()
}

class RootWireframeImpl: RootWireframe {
    weak var viewController: RootViewController?
    
    func openLoginViewController() {
        let loginRepo = LoginRepositoryImpl()
        let useCase = LoginUseCaseImpl(loginRepository: loginRepo)
        let wireframe = LoginWireframeImpl()
        let loginViewController = self.loginViewController()
        wireframe.viewController = loginViewController
        
        let presenter = LoginPresenterImpl(useCase: useCase, viewControllerInput: loginViewController, wireframe: wireframe, rootWireframe: self)
        loginViewController.presenter = presenter
        
        self.viewController?.present(loginViewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}

extension RootWireframeImpl {
    func loginViewController() -> LoginViewController {
        let mainStoryboard = UIStoryboard.mainStoryboare()
        let loginView = mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.login.identity) as! LoginViewController
        return loginView
        
    }
}
