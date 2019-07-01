//
//  TrafficSignUseCase.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol TrafficSignUseCase {
    func loadTraffictSign() -> TrafficSignViewModelImpl
}

struct TrafficSignUseCaseImpl: TrafficSignUseCase {
    
    private let signRepository: SignRepository
    
    public init(signRepository: SignRepository) {
        self.signRepository = signRepository
    }
    
    func loadTraffictSign() -> TrafficSignViewModelImpl {
        let viewModel = TrafficSignViewModelImpl()
        let signs = self.signRepository.getTrafficSign()
        viewModel.signsVar.accept(signs)
        return viewModel
    }
}
