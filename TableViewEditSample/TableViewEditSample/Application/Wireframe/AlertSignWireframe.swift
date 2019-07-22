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
    func openAlertDetailViewController(title: String, image: String)
}

class AlertSignWireframeImpl: AlertSignWireframe {
    weak var viewController: AlertSignViewController?
    
    func closeViewController(completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
    
    func openAlertDetailViewController(title: String, image: String) {
        let wireframe = AlertShowWireframeImpl()
        let alertShowviewControler = self.alertShowViewController()
        let viewModel = AlertShowViewModelImpl(title: title, image: image)
        let presenter = AlertShowPresenterImpl(wireframe: wireframe, viewController: alertShowviewControler, viewModel: viewModel)
        alertShowviewControler.inject(presenter: presenter)
        wireframe.viewController = alertShowviewControler
        self.viewController?.present(alertShowviewControler, animated: true, completion: nil)   
    }
}

fileprivate extension AlertSignWireframeImpl {
    func alertShowViewController() -> AlertShowViewController{
        let mainStoryboard = UIStoryboard.mainStoryboare()
        return mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.alertShow.identity) as! AlertShowViewController
    }
}
