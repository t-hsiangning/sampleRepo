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
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.tableHeaderView = UIView(frame: .zero)
        self.tableView.isEditing = true
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
        self.setTableView(viewModel: viewModel)
    }
    
}


extension TrafficSignViewController {
    func setUpButtonEvent() {
        self.leftBarButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter?.tapClose()
        }).disposed(by: self.disposeBag)
    }
    
    func setTableView(viewModel: TrafficSignViewModel) {
        // if is empty, hide the tableivew
        viewModel.signs.map { $0.filter { !$0.title.isEmpty } }
            .subscribe ({ [weak self] in
                guard let sSelf = self else { return }
                guard let sign = $0.element, sign.count > 0 else {
                    sSelf.tableView.isHidden = true
                    return
                }
                sSelf.tableView.isHidden = false
            }).disposed(by: self.disposeBag)
        
        self.setTableViewDataSource(viewModel: viewModel)
//        viewModel.signs.bind(to: self.tableView.rx.items){ (tableView, row, element) in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "trafficSignCell")!
//            cell.textLabel?.text = element.title
//            return cell
//            }.disposed(by: self.disposeBag)

        // second method
//        self.viewModel?.signs.bind(to: tableView.rx.items(cellIdentifier: "trafficSignCell")) { (row, model, cell) in
//            cell.textLabel?.text = model.title
//            }.disposed(by: self.disposeBag)

    }
    
    func setTableViewDataSource(viewModel: TrafficSignViewModel) {
        let dataSource = self.dataSource()
        var signs:[TrafficSignItemViewModel] = []
        for sign in viewModel.signs.value {
            let tmpSign = TrafficSignItemViewModel(model: sign)
            signs.append(tmpSign)
        }
        
        let initSection: [TrafficSignSection] = [TrafficSignSection(header: "", signs: signs, update: Date())]
        let initialState = SignTableViewState(sections: initSection, isAdded: false)
        
        // TableView Actions Commands
//        let initCommand = viewModel.signs.asObservable()
//            .map({ SignTableViewEditingCommand.InitItems(items: $0)})
        let moveCommand = self.tableView.rx.itemMoved.asObservable().map(SignTableViewEditingCommand.MoveItem)
        
        // Set TableView Actions
        Observable.of(moveCommand)
            .merge().scan(initialState, accumulator: {(state: SignTableViewState, command: SignTableViewEditingCommand) -> SignTableViewState in
                return state.execute(command: command)
            }).startWith(initialState)
            .map({ /*[weak self]*/ item in
//                guard let sSelf = self else { return [TrafficSignSection(header: "", signs: [], update: Date())] }
//                sSelf.editedSongsVar.accept(item.sections[0].songs)
//                if item.isAddSuccess {
//                    sSelf.showToast(message: .addSong)
//                }
                return item.sections
            })
            .share(replay: 1)
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
    }
    
    func dataSource() -> RxTableViewSectionedAnimatedDataSource<TrafficSignSection> {
        return RxTableViewSectionedAnimatedDataSource(
            animationConfiguration: AnimationConfiguration(insertAnimation: .none, reloadAnimation: .fade, deleteAnimation: .fade),
            configureCell: { /*[weak self]*/ (dataSource, table, idxPath, item) in
                let cell: TrafficSignTableViewCell = table.dequeueReusableCell(withIdentifier: "trafficSignCell", for: idxPath) as! TrafficSignTableViewCell
                cell.updateCell(item)
                return cell
        },
            canEditRowAtIndexPath: { _, _ in
                return true
        },
            canMoveRowAtIndexPath: { _, _ in
                return true
        }
        )
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
