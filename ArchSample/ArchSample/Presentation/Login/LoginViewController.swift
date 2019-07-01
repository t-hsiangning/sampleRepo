//
//  LoginViewController.swift
//  ArchSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginViewControllerInput: class {
    func inject(presenter: LoginPresenter)
    func setViewModel(viewModel: LoginViewModel)
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    var viewModel: LoginViewModel?
    
    
    @IBOutlet weak var accountText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.setUpView()
    }
    
}

extension LoginViewController: LoginViewControllerInput {
    func setViewModel(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.accountText.text = self.viewModel?.userIdVar.value
        self.passwordText.text = self.viewModel?.passwordVar.value
        self.setUpButtonEvent()
    }
    
    func inject(presenter: LoginPresenter) {
        self.presenter = presenter
    }
}

private extension LoginViewController {
    func setUpButtonEvent() {
        self.loginButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let sSelf = self else { return }
            guard let loginId = sSelf.accountText.text else { return }
            guard let password = sSelf.passwordText.text else { return }
            sSelf.presenter?.tapLogin(id: loginId, pass: password, isPreserve: true)
            NSLog("login button touch up")
        }).disposed(by: self.disposeBag)
    }
}
