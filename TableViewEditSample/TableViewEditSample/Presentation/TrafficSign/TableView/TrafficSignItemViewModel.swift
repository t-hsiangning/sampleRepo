//
//  TrafficSignItemViewModel.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

// MARK: RxTableViewSectionedAnimatedDataSource usage inherit setting
class TrafficSignItemViewModel {
    var title: String = ""
    var image: String = ""
    
    public required init() {
        self.title = ""
        self.image = ""
    }
    
    public required init(model: TrafficSignModel) {
        self.title = model.title
        self.image = model.image
    }
    
    public required init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

extension TrafficSignItemViewModel: IdentifiableType, Equatable {
    typealias Identity = String
    var identity: String {
        return title
    }
}

func == (lhs: TrafficSignItemViewModel, rhs: TrafficSignItemViewModel) -> Bool {
    return lhs.title == rhs.title
}

extension TrafficSignItemViewModel: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(title)"
    }
}

extension TrafficSignItemViewModel: CustomStringConvertible {
    var description: String {
        return "\(title)"
    }
}

