//
//  TrafficSignPresenter.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol TrafficSignPresenter {
    func setUpView()
    func tapClose()
}

class TrafficSignPresenterImpl: TrafficSignPresenter {
    weak var viewControllerInput: TrafficSignViewControllerInput?
    var wireframe: TrafficSignWireframe
    var useCase: TrafficSignUseCase
    var viewModel: TrafficSignViewModel
    
    public required init(wireframe: TrafficSignWireframe, useCase: TrafficSignUseCase, viewController: TrafficSignViewController) {
        self.viewControllerInput = viewController
        self.wireframe = wireframe
        self.useCase = useCase
        self.viewModel = TrafficSignViewModelImpl()
    }
    
    func setUpView() {
        self.viewModel = self.useCase.loadTraffictSign()
        self.viewControllerInput?.setViewModel(viewModel: self.viewModel)
    }
    
    func tapClose() {
        self.wireframe.closeViewController(completion: {})
    }
}
