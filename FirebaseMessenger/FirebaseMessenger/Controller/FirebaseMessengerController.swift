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
    func tapRegister()
    func tapLogin()
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
        self.customView.btnLogin.rx.tap.bind { [weak self] in
            let loginViewModel = LoginViewModel()
            let login = LoginController(viewModel: loginViewModel)
            self?.navigationController?.pushViewController(login, animated: true)
        }
        
    }

}

