//
//  RegisterController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxRelay

protocol RegisterProtocol {
    func registerFirebase(name:String, secondName: String, email: String, password: String, confirmPassword: String)
    var clickRegisterObserver: Observable<Bool> { get }
    var isEmptyObserver: Observable<Bool> { get }
    var validateDataObserver: Observable<Bool> { get }
    var confirmPassword: Observable<Bool> { get }
}

class RegisterController: BaseViewController<RegisterView> {
    
    var viewModel: RegisterProtocol {
        return baseViewModel as! RegisterProtocol
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

        self.customView.registerButton.rx.tap.bind { [weak self] in
            let name: String = self?.customView.firstNameField.text ?? ""
            let second: String = self?.customView.secondNameField.text ?? ""
            let email: String = self?.customView.emailField.text ?? ""
            let password: String = self?.customView.passwordField.text ?? ""
            let confirmPasswd: String = self?.customView.confirmPasswordField.text ?? ""

            self?.viewModel.registerFirebase(name: name, secondName: second, email: email, password: password, confirmPassword: confirmPasswd)

        }.disposed(by: disposeBag)
        
        self.viewModel.clickRegisterObserver.subscribe(onNext: { value in
            if(value) {
                let viewModel = ConversationsViewModel()
                let controllerConversation = ConversationsController(viewModel: viewModel)
                self.navigationController?.pushViewController(controllerConversation, animated: true)            }
        }).disposed(by: disposeBag)
        
        self.viewModel.validateDataObserver.subscribe(onNext: { value in
            if(value) {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.registerExists, titleBtn: PriviLegiusLocalized.back)
            }
        }).disposed(by: disposeBag)
        
        self.viewModel.isEmptyObserver.subscribe(onNext: { value in
            if (value) {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.allInformationsRegister, titleBtn: PriviLegiusLocalized.back)
            }
        }).disposed(by: disposeBag)
        
        self.viewModel.confirmPassword.subscribe(onNext: {value in
            if(value) {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.noMatchPasswd, titleBtn: PriviLegiusLocalized.back)
            }
        }).disposed(by: disposeBag)
    }
}

