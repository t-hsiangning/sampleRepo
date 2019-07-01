//
//  AlertSignViewModel.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol AlertSignViewModel {
    var signs: Observable<[AlertSignModel]> { get }
    var isError: Observable<Bool> { get }
}

class AlertSignViewModelImpl: AlertSignViewModel {
    var signsVar: BehaviorRelay<[AlertSignModel]> = BehaviorRelay<[AlertSignModel]>(value: [])
    var isErrorVar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var signs: Observable<[AlertSignModel]> {
        get {
            return signsVar.asObservable()
        }
    }
    var isError: Observable<Bool> {
        get {
            return isErrorVar.asObservable()
        }
    }
}
