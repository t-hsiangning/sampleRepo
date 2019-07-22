//
//  AlertSignUseCase.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol AlertSignUseCase {
    func loadAlertSign() -> AlertSignViewModelImpl
}

struct AlertSignUseCaseImpl: AlertSignUseCase {
    
    private let signRepository: SignRepository
    
    public init(signRepository: SignRepository) {
        self.signRepository = signRepository
    }
    
    func loadAlertSign() -> AlertSignViewModelImpl {
        let viewModel = AlertSignViewModelImpl()
        let signs = self.signRepository.getAlertSign()
        viewModel.signsVar.accept(signs)
        return viewModel
    }
}
