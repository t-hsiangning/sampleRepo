//
//  LoginViewModel.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModel {
    var userIdVar  : BehaviorRelay<String> { get }
    var passwordVar: BehaviorRelay<String> { get }
    var isError    : Observable<Bool> { get }
}

class LoginViewModelImpl: LoginViewModel {
    var userIdVar: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var passwordVar: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    // エラー表示
    var isErrorVar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var errorInfoVar = BehaviorRelay<ErrorModel?>(value: nil)
    var isError: Observable<Bool> {
        get {
            return isErrorVar.asObservable()
        }
    }
}
