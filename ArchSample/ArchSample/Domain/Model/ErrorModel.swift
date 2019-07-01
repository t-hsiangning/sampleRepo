//
//  ErrorModel.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

public protocol ErrorModel {
    var code: String { get }
    var message: String { get }
    var devMessage: String { get }
}
