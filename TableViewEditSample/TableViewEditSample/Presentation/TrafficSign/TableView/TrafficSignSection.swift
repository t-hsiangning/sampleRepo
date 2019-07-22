//
//  TrafficSignSection.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxDataSources

struct TrafficSignSection {
    var header: String
    var signs: [TrafficSignItemViewModel]
    var update: Date
    init(header: String, signs: [TrafficSignItemViewModel], update: Date) {
        self.header = header
        self.signs = signs
        self.update = update
    }
}

extension TrafficSignSection: AnimatableSectionModelType {
    typealias Item = TrafficSignItemViewModel
    typealias Identity = String
    var identity: String {
        return header
    }
    
    var items: [TrafficSignItemViewModel] {
        return signs
    }
    
    init(original: TrafficSignSection, items: [TrafficSignItemViewModel]) {
        self = original
        self.signs = items
    }
}

extension TrafficSignSection: CustomDebugStringConvertible {
    var debugDescription: String {
        let intervalTime = update.timeIntervalSince1970
        let signDesc = signs.map{ "\($0.debugDescription)"}.joined(separator: ", ")
        return "SignSection: \(self.header), signs: \(signDesc)\n, update: \(intervalTime)"
    }
}

extension TrafficSignSection: Equatable {
    
}

func == (lhs: TrafficSignSection, rhs: TrafficSignSection) -> Bool {
    return lhs.header == rhs.header && lhs.signs == rhs.signs && lhs.update == rhs.update
}
