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
    func finishRegister(controller: UIViewController)
    func openErrorPassword(controller: UIViewController)
    func openErrorBlanked(controller: UIViewController)
    func registerFirebase(email: String, password: String, confirmPassword: String)
    var clickRegisterObserver: Observable<Bool> { get }
    var isEmptyObserver: Observable<Bool> { get }
    var validateDataObserver: Observable<Bool> { get }
}

class RegisterController: BaseViewController<RegisterView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bind()
        
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
//
//        self.customView.registerButton.rx.tap.bind { [weak self] in
//
////            let email: String = self?.customView.emailField.text ?? ""
////            let password: String = self?.customView.passwordField.text ?? ""
//
//
//
//        }.disposed(by: disposeBag)
        
        
    }
    
}
