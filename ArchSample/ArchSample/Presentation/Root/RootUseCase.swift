//
//  RootUseCase.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift

enum RootScreenType: Int {
    case login
    case main
}

protocol RootUseCase {
    func getScene() -> RootScreenType
}

struct RootUseCaseImpl: RootUseCase {
    private let loginReposiroty: LoginRepository
    
    public init(loginReposiroty: LoginRepository) {
        self.loginReposiroty = loginReposiroty
    }
    
    func getScene() -> RootScreenType {
        // add logic
        return .login
    }
}
