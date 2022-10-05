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
    func loginInFirebase(email: String, senha: String)
    var clickLoginObserver: Observable<Bool> { get }
    var dataIsEmpty: Observable<Bool> { get }
    var valitedData: Observable<Bool> { get }
}

class LoginController: BaseViewController<LoginView> {
    
    var viewModel: LoginProtocol {
        return baseViewModel as! LoginProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
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
                let viewModel = ConversationsViewModel()
                let controllerConversation = ConversationsController(viewModel: viewModel)
                self.navigationController?.pushViewController(controllerConversation, animated: true)
            }
            
        }).disposed(by: disposeBag)
        
        self.viewModel.dataIsEmpty.subscribe(onNext: { value in
            
            if(value) {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.allInformationsLogin, titleBtn: PriviLegiusLocalized.back)
            }
            
        }).disposed(by: disposeBag)
        
        self.viewModel.valitedData.subscribe(onNext: { value in
            
            if (value) {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.errorLogin, titleBtn: PriviLegiusLocalized.back)
            }
            
        }).disposed(by: disposeBag)
    }
}
