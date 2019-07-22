//
//  AlertShowViewModel.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

protocol AlertShowViewModel {
    var signTitle: String { get }
    var signImage: String { get }
}

class AlertShowViewModelImpl: AlertShowViewModel {
    var signTitle: String = ""
    var signImage: String = ""
    
    public init(title: String, image: String) {
        self.signTitle = title
        self.signImage = image
    }
}
