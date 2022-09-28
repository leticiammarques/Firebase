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
    
    func alertUserError(controller: UIViewController) {
        let alert = UIAlertController(title: "Oooopa", message: "Email e/ou senha incorretos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
}

extension LoginViewModel: LoginProtocol {
    
    func openModalErroData(controller: UIViewController) {
        self.alertUserError(controller: controller)
    }
    
    func openModalErro(controller: UIViewController) {
        self.alertUserLoginError(controller: controller)
    }
    
    func openConversation(controller: UIViewController) {
        self.openHome(controller: controller)
    }
    
    func loginInFirebase(email: String, senha: String) {
        self.loginUser(email: email, senha: senha)
    }
    
    var clickLoginObserver: Observable<Bool> {
        return clickLoginRelay.asObservable()
    }
    
    var valitedData: Observable<Bool> {
        return verificatedDataRelay.asObservable()
    }
    
    
    var dataIsEmpty: Observable<Bool> {
        return verificatedCampsRelay.asObservable()
    }
    
}
