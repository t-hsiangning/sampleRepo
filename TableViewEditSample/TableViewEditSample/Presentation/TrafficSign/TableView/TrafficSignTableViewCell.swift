//
//  TrafficSignTableViewCell.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/23.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift

class TrafficSignTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var signImage: UIImageView!
    
    var itemViewModel: TrafficSignItemViewModel = TrafficSignItemViewModel()
    var disposeBag = DisposeBag()
    
    func updateCell(_ signViewModel: TrafficSignItemViewModel) {
        self.itemViewModel = signViewModel
        self.title.text = signViewModel.title
        
        self.signImage.getLocalImage(path: signViewModel.image)
        
//        if for download image
//        signViewModel.url
//            .subscribe({[weak self] event in
//                guard let sSelf = self, let imgUrl = event.element else { return }
//                sSelf.image.getImgae(imgUrl)
//            }).disposed(by: self.disposeBag)

    }
    
}
