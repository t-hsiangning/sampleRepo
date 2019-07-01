//
//  RootViewController.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit

protocol RootViewControllerInput: class {
    func inject(presenter: RootPresenter)
}

class RootViewController: UIViewController {
    
    var presenter: RootPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.loacScene()
    }
}

extension RootViewController: RootViewControllerInput {
    func inject(presenter: RootPresenter) {
        self.presenter = presenter
    }
}
