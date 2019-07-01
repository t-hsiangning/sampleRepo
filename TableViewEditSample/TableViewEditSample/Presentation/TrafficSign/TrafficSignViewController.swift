//
//  TrafficSignViewController.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

protocol TrafficSignViewControllerInput: class {
    func inject(presenter: TrafficSignPresenter)
    func setViewModel(viewModel: TrafficSignViewModel)
}

class TrafficSignViewController: UIViewController {
    var presenter: TrafficSignPresenter?
    var viewModel: TrafficSignViewModel?
    
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

extension TrafficSignViewController: TrafficSignViewControllerInput {
    func inject(presenter: TrafficSignPresenter) {
        self.presenter = presenter
    }
    
    func setViewModel(viewModel: TrafficSignViewModel) {
        self.viewModel = viewModel
        self.setUpButtonEvent()
        self.setTableView()
    }
    
}


extension TrafficSignViewController {
    func setUpButtonEvent() {
        self.leftBarButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapClose()
        }).disposed(by: self.disposeBag)
    }
    
    func setTableView() {
        self.viewModel?.signs.bind(to: self.tableView.rx.items){ (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "trafficSignCell")!
            cell.textLabel?.text = element.title
            return cell
            }.disposed(by: self.disposeBag)
        
        // second method
        //        self.viewModel?.signs.bind(to: tableView.rx.items(cellIdentifier: "trafficSignCell")) { (row, model, cell) in
        //            cell.textLabel?.text = model.title
        //        }.disposed(by: self.disposeBag)
    }
}


//
//struct SignSection {
//    var header: String
//    var items: [Item]
//}
//
//extension SignSection: AnimatableSectionModelType {
//    typealias Item = Int
//    var identity: String {
//        return header
//    }
//
//    init(original: SignSection, items: [Item]) {
//        self = original
//        self.items = items
//    }
//}
