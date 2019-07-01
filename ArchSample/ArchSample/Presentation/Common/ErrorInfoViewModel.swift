//
//  ErrorInfoViewModel.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation
import RxCocoa

// エラー表示系
protocol ErrorInfoViewModel {
    var isErrorVar: BehaviorRelay<Bool> { get }
    var errorInfoVar: BehaviorRelay<ErrorModel?> { get }
}
