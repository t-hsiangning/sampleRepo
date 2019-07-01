//
//  RootPresenter.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//


import Foundation
import RxSwift

protocol RootPresenter {
    func loacScene()
}

class RootPresenterImpl: RootPresenter {
    weak var viewControllerInput: RootViewControllerInput?
    var wireframe: RootWireframe?
    var useCase: RootUseCase
    
    private let disposeBag = DisposeBag()
    
    public required init(useCase: RootUseCase, viewControllerInput: RootViewControllerInput, wireframe: RootWireframe) {
        self.useCase = useCase
        self.viewControllerInput = viewControllerInput
        self.wireframe = wireframe
    }
    
    func loacScene() {
        switch self.useCase.getScene() {
        case .main:
            NSLog("open main") // Do nothing
        case .roadSign:
            NSLog("open login")
            self.wireframe?.openRoadSignViewController()
        }
    }
}
