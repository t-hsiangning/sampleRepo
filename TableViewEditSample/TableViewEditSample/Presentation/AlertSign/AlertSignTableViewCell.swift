//
//  AlertSignTableViewCell.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift

class AlertSignTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var signImage: UIImageView!
    
    var disposeBag = DisposeBag()
    
    func updateCell(_ viewModel: AlertSignModel) {
        self.title.text = viewModel.title
        self.signImage.getLocalImage(path: viewModel.image)
    }
}
