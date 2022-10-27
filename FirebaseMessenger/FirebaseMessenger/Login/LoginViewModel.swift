//
//  LoginViewModel.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 13/09/22.
//

import UIKit
import FirebaseAuth
import RxCocoa
import RxSwift



class LoginViewModel: BaseViewModel {
    
    private let clickLoginRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let clickForgetPasswordRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let verificatedCampsRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let verificatedDataRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    private func loginUser(email: String, senha: String) {
        
        guard !email.isEmpty, !senha.isEmpty else {
            print("email/senha não podem estar vazios")
            self.verificatedCampsRelay.accept(true)
            return
        }
            
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: senha, completion: {[weak self] authResult, error in
            
            guard let result = authResult, error == nil else {
                print("Falha no login do usuário do email: \(email)")
                self?.verificatedDataRelay.accept(true)
                return
            }
            
            let user = result.user
            print("Login do usuário \(user)")
            
            self?.clickLoginRelay.accept(true)
        })
    }
    
    
    func openForgetPassword() {
        self.clickForgetPasswordRelay.accept(true)
    }
}

extension LoginViewModel: LoginProtocol {    
    
    func loginInFirebase(email: String, senha: String) {
        self.loginUser(email: email, senha: senha)
    }
    
    func clickForgetPassword() {
        self.openForgetPassword()
    }
    
    var clickLoginObserver: Observable<Bool> {
        return clickLoginRelay.asObservable()
    }
    
    var clickForgetPasswdObserver: Observable<Bool> {
        return clickForgetPasswordRelay.asObservable()
    }
    
    var valitedData: Observable<Bool> {
        return verificatedDataRelay.asObservable()
    }
    
    
    var dataIsEmpty: Observable<Bool> {
        return verificatedCampsRelay.asObservable()
    }
    
}
