//
//  RootUseCase.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift

enum RootScreenType: Int {
    case roadSign
    case main
}

protocol RootUseCase {
    func getScene() -> RootScreenType
}

struct RootUseCaseImpl: RootUseCase {
    
    public init() {
    }
    
    func getScene() -> RootScreenType {
        // add logic
        return .roadSign
    }
}
