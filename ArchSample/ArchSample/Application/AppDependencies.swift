//
//  AppDependencies.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
//    func openRootViewController
    
    private func rootViewController() -> RootViewController{
        let mainStoryboard = UIStoryboard.mainStoryboare()
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.root.identity) as! RootViewController
        return rootViewController
    }
}
