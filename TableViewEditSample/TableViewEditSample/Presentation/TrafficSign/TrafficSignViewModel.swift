//
//  TrafficSignViewModel.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TrafficSignViewModel {
    var signs: Observable<[TrafficSignModel]> { get }
    var isError: Observable<Bool> { get }
}

class TrafficSignViewModelImpl: TrafficSignViewModel {
    var signsVar: BehaviorRelay<[TrafficSignModel]> = BehaviorRelay<[TrafficSignModel]>(value: [])
    var isErrorVar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var signs: Observable<[TrafficSignModel]> {
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
