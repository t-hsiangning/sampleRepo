//
//  AlertShowViewController.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol AlertShowViewControllerInput: class {
    func inject(presenter: AlertShowPresenter)
    func setViewModel(viewModel: AlertShowViewModel)
}

class AlertShowViewController: UIViewController {
    
    var presenter: AlertShowPresenter?
    var viewModel: AlertShowViewModel?
    
    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var signTitle: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setUpView()
    }
    
}

extension AlertShowViewController: AlertShowViewControllerInput {
    func inject(presenter: AlertShowPresenter) {
        self.presenter = presenter
    }
    
    func setViewModel(viewModel: AlertShowViewModel) {
        self.viewModel = viewModel
        
        self.signTitle.text = viewModel.signTitle
        self.signImage.getLocalImage(path: viewModel.signImage)
        
        self.closeButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapClose()
        }).disposed(by: self.disposeBag)
    }
    
    
}
