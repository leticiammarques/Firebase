//
//  ConfirmEmailController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 14/10/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

protocol ConfirmEmailProtocol {
    func verifyEmail(email: String)
    var clickVericatedObserver: Observable<Bool> { get }
    var clickNotVericatedObserver: Observable<Bool> { get }
    var vericatedIsEmptyObserver: Observable<Bool> { get }
}

class ConfirmEmailController: BaseViewController<ConfirmEmailView> {
    
    var viewModel: ConfirmEmailProtocol {
        return baseViewModel as! ConfirmEmailProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bind()
        
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
        
        self.customView.btnConfirm.rx.tap.bind { [weak self] in
            let email: String = self?.customView.emailField.text ?? ""
            
            self?.viewModel.verifyEmail(email: email)
        }.disposed(by: disposeBag)
        
        self.viewModel.clickVericatedObserver.subscribe(onNext: { value in
            if value {
                self.openModalSimple(title: PriviLegiusLocalized.sucess, body: PriviLegiusLocalized.verifyEmail, titleBtn: PriviLegiusLocalized.back)
            }
        }).disposed(by: disposeBag)
        
        self.viewModel.clickNotVericatedObserver.subscribe(onNext: { value in
            if value {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.emailNoVerify, titleBtn: PriviLegiusLocalized.back)
            }
        }).disposed(by: disposeBag)
        
        self.viewModel.vericatedIsEmptyObserver.subscribe(onNext: { value in
            if value {
                self.openModalSimple(title: PriviLegiusLocalized.ops, body: PriviLegiusLocalized.txtFieldVerifyEmailIsEmpty, titleBtn: PriviLegiusLocalized.back)
            }
        }).disposed(by: disposeBag)
    }
}
