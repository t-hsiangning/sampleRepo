//
//  RoadSignPresenter.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol RoadSignPresenter {
    func setUpView()
    func tapTrafficSign()
    func tapAlertSign()
}

class RoadSignPresenterImpl: RoadSignPresenter {
    weak var viewControllerInput: RoadSignViewControllerInput?
    var wireframe: RoadSignWireframe
    var useCase: RoadSignUseCase
    
    public required init(wireframe: RoadSignWireframe, useCase: RoadSignUseCase, viewController: RoadSignViewController) {
        self.viewControllerInput = viewController
        self.wireframe = wireframe
        self.useCase = useCase
    }
    
    func setUpView() {
        self.viewControllerInput?.setViewModel()
    }
    
    func tapTrafficSign() {
        self.wireframe.openTrafficSignViewController()
    }
    
    func tapAlertSign() {
        self.wireframe.openAlertSignViewController()
    }
}
