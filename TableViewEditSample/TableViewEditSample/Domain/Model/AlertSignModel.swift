//
//  AlertSignModel.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

public protocol AlertSignModel {
    var title: String { get }
    var image: String { get }
}

struct AlertSignModelImpl: AlertSignModel {
    let title: String
    let image: String
    
    init(entity: AlertPLEntity) {
        self.title = entity.title
        self.image = entity.image
    }
}
