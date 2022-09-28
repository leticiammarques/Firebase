//
//  LoginController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxRelay

protocol LoginProtocol {
    func openConversation(controller: UIViewController)
    func openModalErro(controller: UIViewController)
    func loginInFirebase(email: String, senha: String)
    var clickLoginObserver: Observable<Bool> { get }
}

class LoginController: BaseViewController<LoginView> {
    
    var viewModel: LoginProtocol {
        return baseViewModel as! LoginProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        bind()
    }
    
    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "btn_back")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }

    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func bind() {
        
        disposeBag = DisposeBag()
                
        self.customView.btnLogin.rx.tap.bind { [weak self] in

            let email: String = self?.customView.emailField.text ?? ""
            let password: String = self?.customView.passwordField.text ?? ""
            
            self?.viewModel.loginInFirebase(email: email, senha: password)
            
        }.disposed(by: disposeBag)
        
        self.viewModel.clickLoginObserver.subscribe(onNext: { value in
            if(value) {
                self.viewModel.openConversation(controller: self)
            } else {
                self.viewModel.openModalErro(controller: self)
            }
        }).disposed(by: disposeBag)
    }
}
