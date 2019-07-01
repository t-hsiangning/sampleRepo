//
//  LoginModel.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

public protocol LoginModel {
    var sessionId  : String { get }
    var accountId  : String { get }
}
