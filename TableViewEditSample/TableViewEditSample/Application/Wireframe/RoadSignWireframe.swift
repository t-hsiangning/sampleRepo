//
//  RoadSignWireframe.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol RoadSignWireframe: class {
    var viewController: RoadSignViewController? { get set }
    func openTrafficSignViewController()
    func openAlertSignViewController()
    func closeViewController(completion: (() -> Void)?)
}

class RoadSignWireframeImpl: RoadSignWireframe {
    weak var viewController: RoadSignViewController?
    
    func openTrafficSignViewController() {
        let signRepo = SignRepositoryImpl()
        let useCase = TrafficSignUseCaseImpl(signRepository: signRepo)
        let wireframe = TrafficSignWireframeImpl()
        let trafficNavigationController = self.trafficNavigationViewContoller()
        let trafficViewController = self.trafficViewController(trafficNavigationController)
        let presenter = TrafficSignPresenterImpl(wireframe: wireframe, useCase: useCase, viewController: trafficViewController)
        trafficViewController.inject(presenter: presenter)
        wireframe.viewController = trafficViewController
        self.viewController?.present(trafficNavigationController, animated: true, completion: nil)
    }
    
    func openAlertSignViewController() {
        let signRepo = SignRepositoryImpl()
        let useCase = AlertSignUseCaseImpl(signRepository: signRepo)
        let wireframe = AlertSignWireframeImpl()
        let alertNavigationController = self.alertNavigationController()
        let alertViewController = self.alertViewController(alertNavigationController)
        let presenter = AlertSignPresenterImpl(wireframe: wireframe, useCase: useCase, viewController: alertViewController)
        alertViewController.inject(presenter: presenter)
        wireframe.viewController = alertViewController
        self.viewController?.present(alertNavigationController, animated: true, completion: nil)
    }
    
    func closeViewController(completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
}

fileprivate extension RoadSignWireframeImpl {
    func trafficNavigationViewContoller() -> UINavigationController {
        let mainStoryboard = UIStoryboard.mainStoryboare()
        return mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.trafficSignNavigation.identity) as! UINavigationController
    }
    
    func trafficViewController( _ navigation: UINavigationController) -> TrafficSignViewController {
        return navigation.children[0] as! TrafficSignViewController
    }
    
    func alertNavigationController() -> UINavigationController {
        let mainStoryboard = UIStoryboard.mainStoryboare()
        return mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.alertSignNavigation.identity) as! UINavigationController
    }
    
    func alertViewController( _ navigation: UINavigationController) -> AlertSignViewController {
        return navigation.children[0] as! AlertSignViewController
    }
}
