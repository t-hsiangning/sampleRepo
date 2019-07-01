//
//  AlertSignPresenter.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol AlertSignPresenter {
    func setUpView()
    func tapClose()
}

class AlertSignPresenterImpl: AlertSignPresenter {
    weak var viewControllerInput: AlertSignViewControllerInput?
    var wireframe: AlertSignWireframe
    var useCase: AlertSignUseCase
    var viewModel: AlertSignViewModel
    
    public required init(wireframe: AlertSignWireframe, useCase: AlertSignUseCase, viewController: AlertSignViewControllerInput) {
        self.viewControllerInput = viewController
        self.wireframe = wireframe
        self.useCase = useCase
        self.viewModel = AlertSignViewModelImpl()
    }
    
    func setUpView() {
        self.viewModel = self.useCase.loadAlertSign()
        self.viewControllerInput?.setViewModel(viewModel: self.viewModel)
    }
    
    func tapClose() {
        self.wireframe.closeViewController(completion: {})
    }
}