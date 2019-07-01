//
//  LoginUseCase.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol LoginUseCase {
    func loadAccount() -> LoginViewModelImpl
    func login(id: String, pass: String, isPreserve: Bool, viewModel: LoginViewModelImpl, complete: @escaping () -> Void, failed: @escaping () -> Void)
}

struct LoginUseCaseImpl: LoginUseCase {
    
    private let loginRepository: LoginRepository
    public init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func loadAccount() -> LoginViewModelImpl {
        let viewModel = LoginViewModelImpl()
        return viewModel
    }
    
    func login(id: String, pass: String, isPreserve: Bool, viewModel: LoginViewModelImpl, complete: @escaping () -> Void, failed: @escaping () -> Void) {
        // USE APIManager to go through the login
    }
}
