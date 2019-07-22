//
//  AlertShowPresenter.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol AlertShowPresenter {
    func setUpView()
    func tapClose()
}

class AlertShowPresenterImpl: AlertShowPresenter {
    
    weak var viewControllerInput: AlertShowViewControllerInput?
    var wireframe: AlertShowWireframe
//    var useCase: AlertShowUseCase
    var viewModel: AlertShowViewModel
    
    public required init(wireframe: AlertShowWireframe, viewController: AlertShowViewControllerInput, viewModel: AlertShowViewModel) {
        self.wireframe = wireframe
        self.viewControllerInput = viewController
        self.viewModel = viewModel
    }
    
    func setUpView() {
        self.viewControllerInput?.setViewModel(viewModel: self.viewModel)
    }
    
    func tapClose() {
        self.wireframe.closeViewController(completion: nil)
    }
}
