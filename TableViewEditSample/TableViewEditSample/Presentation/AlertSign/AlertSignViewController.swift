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
    func setViewModel(viewModel: AlertSignViewModelImpl)
}

class AlertSignViewController: UIViewController {
    var presenter: AlertSignPresenter?
    var viewModel: AlertSignViewModelImpl?
    
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setUpView()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.tableHeaderView = UIView(frame: .zero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension AlertSignViewController: AlertSignViewControllerInput {
    func inject(presenter: AlertSignPresenter) {
        self.presenter = presenter
    }
    
    func setViewModel(viewModel: AlertSignViewModelImpl) {
        self.viewModel = viewModel
        self.setUpButtonEvent()
        self.setTableView(viewModel: viewModel)
    }
}

extension AlertSignViewController {
    func setUpButtonEvent() {
        self.leftBarButton.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapClose()
        }).disposed(by: self.disposeBag)
    }
    
    func setTableView(viewModel: AlertSignViewModel) {
//        self.viewModel?.signs.bind(to: self.tableView.rx.items(cellIdentifier: "alertSignCell")) { (row, model, cell) in
//            cell.textLabel?.text = model.title
//            }.disposed(by: self.disposeBag)

        // third method
        viewModel.signs
            .bind(to: self.tableView.rx.items(cellIdentifier: "alertSignCell", cellType: AlertSignTableViewCell.self)) { [weak self] (row, element, cell) in
                //                guard let sSelf = self else { return }
                
                cell.updateCell(element)
            }.disposed(by: self.disposeBag)
        
        self.tableView.rx.itemSelected.subscribe(onNext: {[weak self] indexPath in
            guard let sSelf = self else { return }
            guard let selectSign = sSelf.viewModel?.signsVar.value[indexPath.row] else { return }
            let selectTitle = selectSign.title
            let selectImage = selectSign.image
            sSelf.presenter?.tapAlertSign(title: selectTitle, image: selectImage)
            
        }).disposed(by: self.disposeBag)
    }
}
