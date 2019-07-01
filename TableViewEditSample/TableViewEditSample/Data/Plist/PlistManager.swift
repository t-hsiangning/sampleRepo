//
//  PlistManager.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

let PLIST_EXTENSION = "plist"
let ALERT_SIGN_PLIST_PATH = "AlertSign"
let TRAFFIC_SIGN_PLIST_PATH = "TrafficSign"
struct PlistManager {
        
    static func getTrafficSign() -> [TrafficPLEntity]? {
        let plistUrl = Bundle.main.url(forResource: TRAFFIC_SIGN_PLIST_PATH, withExtension: PLIST_EXTENSION)!
        if let data = try? Data(contentsOf: plistUrl) {
            let decoder = PropertyListDecoder()
            do {
                return try decoder.decode([TrafficPLEntity].self, from: data)
            } catch let e {
                NSLog("plist decode error, \(e)")
                return nil
            }
        }
        return nil
    }
    
    static func getAlertSign() -> [AlertPLEntity]? {
        let plistUrl = Bundle.main.url(forResource: ALERT_SIGN_PLIST_PATH, withExtension: PLIST_EXTENSION)!
        if let data = try? Data(contentsOf: plistUrl) {
            let decoder = PropertyListDecoder()
            do {
                return try decoder.decode([AlertPLEntity].self, from: data)
            } catch let e {
                NSLog("plist decode error, \(e)")
                return nil
            }
        }
        return nil
    }
}
