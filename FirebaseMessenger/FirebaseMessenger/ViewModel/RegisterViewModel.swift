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

        guard passwd == confirmPasswd else {
            print("Senhas não são compatíveis")
            self.verificatedPasswordRelay.accept(true)
            return
        }

        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: passwd, completion: { authResult, error in
            
            guard authResult != nil, error == nil else {
                print("Error cureating user")
                return
            }
            
            let user = authResult!.user
            print("Cadastro do usuário \(user)")
            
            self.clickRegisterRelay.accept(true)
        })
             
    }
    
    func openHome(controller: UIViewController) {
        let viewModel = ConversationsViewModel()
        let controllerConversation = ConversationsController(viewModel: viewModel)
        controller.navigationController?.pushViewController(controllerConversation, animated: true)
    }
    
    func alertBlankedError(controller: UIViewController) {
        let alert = UIAlertController(title: "Oooopa", message: "Por favor, insira todas as informações para fazer login.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
    
    func alertRegisterUserError(controller: UIViewController) {
        let alert = UIAlertController(title: "Oooopa", message: "Constamos um cadastro já realizado pra esse usuário. Tente logar para acessar o PreviLegius.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
    
    func alertUserError(controller: UIViewController) {
        let alert = UIAlertController(title: "Oooopa", message: "Senhas não compatíveis!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
}

extension RegisterViewModel: RegisterProtocol {
    
    func openErrorUserCreated(controller: UIViewController) {
        self.alertRegisterUserError(controller: controller)
    }
    
    func openErrorPassword(controller: UIViewController) {
        self.alertUserError(controller: controller)
    }
    
    func openErrorBlanked(controller: UIViewController) {
        self.alertBlankedError(controller: controller)
    }
    
    
    func finishRegister(controller: UIViewController) {
        self.openHome(controller: controller)
    }
    
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
