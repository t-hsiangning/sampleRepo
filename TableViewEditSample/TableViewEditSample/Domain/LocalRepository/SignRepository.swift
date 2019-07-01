//
//  SignRepository.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

public protocol SignRepository {
    func getTrafficSign() -> [TrafficSignModel]
    func getAlertSign() -> [AlertSignModel]
}

struct SignRepositoryImpl: SignRepository {
    func getTrafficSign() -> [TrafficSignModel] {
        var traffModels: [TrafficSignModel] = []
        guard let traffSign = PlistManager.getTrafficSign() else { return traffModels }
        for trModel in traffSign {
            let tmp = TrafficSignModelImpl(entity: trModel)
            traffModels.append(tmp)
        }
        return traffModels
    }
    
    func getAlertSign() -> [AlertSignModel] {
        var alertModels: [AlertSignModel] = []
        guard let alertSign = PlistManager.getAlertSign() else { return alertModels }
        for alModel in alertSign {
            let tmp = AlertSignModelImpl(entity: alModel)
            alertModels.append(tmp)
        }
        return alertModels
    }
}
