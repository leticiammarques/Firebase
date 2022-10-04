//
//  RegisterViewModel.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 13/09/22.
//

import UIKit
import RxCocoa
import RxSwift
import FirebaseAuth

class RegisterViewModel: BaseViewModel {
    
    private let clickRegisterRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let dataVerificatedRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let verificatedIsEmptyRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let verificatedPasswordRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    private func register(name: String, secondName: String, email: String, passwd: String, confirmPasswd: String) {
        
        guard !name.isEmpty, !secondName.isEmpty, !email.isEmpty, !passwd.isEmpty, !confirmPasswd.isEmpty else {
            print("email/senha não podem estar vazios")
            self.verificatedIsEmptyRelay.accept(true)
            return
        }
        
        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exist in
            
            guard passwd == confirmPasswd else {
                print("Senhas não são compatíveis")
                self?.verificatedPasswordRelay.accept(true)
                return
            }
            
            guard !exist else {
                print("usuário existe")
                self?.dataVerificatedRelay.accept(true)
                return
            }

            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: passwd, completion: { authResult, error in
                
                guard authResult != nil, error == nil else {
                    print("Error cureating user")
                    return
                }
                
                let user = authResult!.user
                print("Cadastro do usuário \(user)")
                
                DatabaseManager.shared.insertUser(with: ChatAppUser(firstName: name, lastName: secondName, emailAddress: email, password: passwd))
                
                self?.clickRegisterRelay.accept(true)
            })            
        })
    }
}

extension RegisterViewModel: RegisterProtocol {
    
    func registerFirebase(name:String, secondName: String, email: String, password: String, confirmPassword: String) {
        self.register(name: name, secondName: secondName, email: email, passwd: password, confirmPasswd: confirmPassword)
    }
    
    var isEmptyObserver: Observable<Bool> {
        return verificatedIsEmptyRelay.asObservable()
    }
    
    var validateDataObserver: Observable<Bool> {
        return dataVerificatedRelay.asObservable()
    }
    
    var clickRegisterObserver: Observable<Bool> {
        return clickRegisterRelay.asObservable()
    }
    
    var confirmPassword: Observable<Bool> {
        return verificatedPasswordRelay.asObservable()
    }
}
