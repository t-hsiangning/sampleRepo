//
//  AppDelegate.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let loginRepo = LoginRepositoryImpl()
        let useCase = RootUseCaseImpl(loginReposiroty: loginRepo)
        let wireframe = RootWireframeImpl()
        let viewControler = self.rootViewController()
        wireframe.viewController = viewControler
        
        let presenter = RootPresenterImpl(useCase: useCase, viewControllerInput: viewControler, wireframe: wireframe)
        viewControler.inject(presenter: presenter)
        
        window?.rootViewController = viewControler
        return true
    }

    
    private func rootViewController() -> RootViewController {
        let mainStoryboard = UIStoryboard.mainStoryboare()
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: VCIDConstants.root.identity) as! RootViewController
        return rootViewController
    }
}

