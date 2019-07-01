//
//  LoginRepository.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public protocol LoginRepository {
    func loginRequest(id: String, pass: String, onSuccess:@escaping ((_ model: LoginModel)->Void), onError:@escaping ((_ model: ErrorModel)->Void))
}

struct LoginRepositoryImpl: LoginRepository {
    private let disposeBag = DisposeBag()
    
    func loginRequest(id: String, pass: String, onSuccess:@escaping ((_ model: LoginModel)->Void), onError:@escaping ((_ model: ErrorModel)->Void)) {
        /// Call APIManager to Handle
    }
    
}
