//
//  RootWireframe.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

protocol RootWireframe: class {
    var viewController: RootViewController? { get set }
    func openRoadSignViewController()
    func dismiss()
}

class RootWireframeImpl: RootWireframe {
    weak var viewController: RootViewController?
    
    func openRoadSignViewController() {
        let useCase = RoadSignUseCaseImpl()
        let wireframe = RoadSignWireframeImpl()
        let roadViewController = self.roadSignViewController()
        wireframe.viewController = roadViewController
        let presenter = RoadSignPresenterImpl(wireframe: wireframe, useCase: useCase, viewController: roadViewController)
        roadViewController.inject(presenter: presenter)
        self.viewController?.present(roadViewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}

fileprivate extension RootWireframeImpl {
    func roadSignViewController() -> RoadSignViewController {
        let mainStoryboard = UIStoryboard.mainStoryboare()
        return mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.roadSign.identity) as! RoadSignViewController
    }
}
