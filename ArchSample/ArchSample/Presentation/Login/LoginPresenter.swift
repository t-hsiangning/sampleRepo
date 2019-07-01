//
//  LoginPresenter.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginPresenter {
    func tapLogin(id: String, pass: String, isPreserve: Bool)
    func setUpView()
    //    func showError()
}

class LoginPresenterImpl {
    
    weak var viewControllerInput: LoginViewControllerInput?
    var rootWireframe: RootWireframe
    var wireframe: LoginWireframe
    var viewModel: LoginViewModelImpl = LoginViewModelImpl()
    var useCase: LoginUseCase
    
    private let disposeBag = DisposeBag()
    
    public required init(useCase: LoginUseCase, viewControllerInput: LoginViewControllerInput, wireframe: LoginWireframe, rootWireframe: RootWireframe) {
        self.useCase = useCase
        self.viewControllerInput = viewControllerInput
        self.wireframe = wireframe
        self.rootWireframe = rootWireframe
    }
}

extension LoginPresenterImpl: LoginPresenter {
    
    func setUpView() {
        // tmp set data
        self.viewModel.userIdVar.accept("TMP USER ID")
        self.viewModel.passwordVar.accept("TMP PASSWORD")
        self.viewControllerInput?.setViewModel(viewModel: self.viewModel)
    }
    
    func tapLogin(id: String, pass: String, isPreserve: Bool) {
        self.useCase.login(id: id, pass: pass, isPreserve: isPreserve, viewModel: self.viewModel, complete: {
            // success login and dismiss the loginViewController
        }, failed: {
            // Show Error View
        })
    }
}
