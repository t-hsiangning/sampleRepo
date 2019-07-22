//
//  RoadSignViewModel.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol RoadSignViewModel {
    var isError    : Observable<Bool> { get }
}

class RoadSignViewModelImpl: RoadSignViewModel {
    // show error
    var isErrorVar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
//    var errorInfoVar = BehaviorRelay<ErrorModel?>(value: nil)
    var isError: Observable<Bool> {
        get {
            return isErrorVar.asObservable()
        }
    }
}
