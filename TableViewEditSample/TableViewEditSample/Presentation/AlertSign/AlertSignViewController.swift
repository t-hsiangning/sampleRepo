//
//  AlertSignViewController.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

protocol AlertSignViewControllerInput: class {
    func inject(presenter: AlertSignPresenter)
    func setViewModel(viewModel: AlertSignViewModel)
}

class AlertSignViewController: UIViewController {
    var presenter: AlertSignPresenter?
    var viewModel: AlertSignViewModel?
    
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension AlertSignViewController: AlertSignViewControllerInput {
    func inject(presenter: AlertSignPresenter) {
        self.presenter = presenter
    }
    
    func setViewModel(viewModel: AlertSignViewModel) {
        self.viewModel = viewModel
        self.setUpButtonEvent()
        self.setTableView()
    }
}

extension AlertSignViewController {
    func setUpButtonEvent() {
        self.leftBarButton.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapClose()
        }).disposed(by: self.disposeBag)
    }
    
    func setTableView() {
        self.viewModel?.signs.bind(to: self.tableView.rx.items(cellIdentifier: "alertSignCell")) { (row, model, cell) in
            cell.textLabel?.text = model.title
        }.disposed(by: self.disposeBag)
    }
}
