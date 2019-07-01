//
//  RoadSignViewController.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol RoadSignViewControllerInput: class {
    func inject(presenter: RoadSignPresenter)
    func setViewModel()
}

class RoadSignViewController: UIViewController {
    var presenter: RoadSignPresenter?
    
    @IBOutlet weak var trafficSignBuggon: UIButton!
    @IBOutlet weak var alertSignButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension RoadSignViewController: RoadSignViewControllerInput {
    func inject(presenter: RoadSignPresenter) {
        self.presenter = presenter
    }
    
    func setViewModel() {
        self.setUpButtonEvent()
    }
}

fileprivate extension RoadSignViewController {
    func setUpButtonEvent() {
        self.trafficSignBuggon.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapTrafficSign()
        }).disposed(by: self.disposeBag)
        
        self.alertSignButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapAlertSign()
        }).disposed(by: self.disposeBag)
    }
}
