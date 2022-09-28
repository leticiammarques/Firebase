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
    
    private func loginUser(email: String, senha: String) {
        
        if email.isEmpty || senha.isEmpty {
            print("email/senha não podem estar vazios")
            self.clickLoginRelay.accept(false)
        } else {
            
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: senha, completion: {[weak self] authResult, error in
                
                guard let result = authResult, error == nil else {
                    print("Falha no login do usuário do email: \(email)")
                    return
                }
                
                let user = result.user
                print("Login do usuário \(user)")
                
                self?.clickLoginRelay.accept(true)
            })
        }
        
    }
    
    func openHome(controller: UIViewController) {
        let viewModel = ConversationsViewModel()
        let controllerConversation = ConversationsController(viewModel: viewModel)
        controller.navigationController?.pushViewController(controllerConversation, animated: true)
    }
    
    func alertUserLoginError(controller: UIViewController) {
        let alert = UIAlertController(title: "Oooopa", message: "Por favor, insira todas as informações para fazer login.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
}

extension LoginViewModel: LoginProtocol {
    func openModalErro(controller: UIViewController) {
        self.alertUserLoginError(controller: controller)
    }
    
    func openConversation(controller: UIViewController) {
        self.openHome(controller: controller)
    }
    
    var clickLoginObserver: Observable<Bool> {
        return clickLoginRelay.asObservable()
    }
    
    
    func loginInFirebase(email: String, senha: String) {
        self.loginUser(email: email, senha: senha)
    }
        
}
