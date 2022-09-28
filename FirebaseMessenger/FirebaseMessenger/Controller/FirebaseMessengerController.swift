//
//  ViewController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

protocol FirebaseMessengerProtocol {
    func tapRegister(controller: UIViewController)
    func tapLogin(controller: UIViewController)
}

class FirebaseMessengerController: BaseViewController<FirebaseMessengerView> {
    
    var viewModel: FirebaseMessengerProtocol {
        return baseViewModel as! FirebaseMessengerProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bind()
    }
    


    func bind() {
        disposeBag = DisposeBag()
        
        self.customView.btnLogin.rx.tap.bind { [weak self] in
            self?.viewModel.tapLogin(controller: self!)
        }.disposed(by: disposeBag)
        
        self.customView.btnCadastro.rx.tap.bind { [weak self] in
            self?.viewModel.tapRegister(controller: self!)
        }.disposed(by: disposeBag)
        
    }

}

