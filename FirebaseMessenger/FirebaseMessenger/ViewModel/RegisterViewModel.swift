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
    
    
    private func register(name: String, secondName: String, email: String, passwd: String, confirmPasswd: String) {
        
        guard !name.isEmpty, !secondName.isEmpty, !email.isEmpty, !passwd.isEmpty, !confirmPasswd.isEmpty else {
            print("email/senha não podem estar vazios")
            self.verificatedIsEmptyRelay.accept(true)
            return
        }
        
        
        
        // Firebase Register
        
//        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exists in
//
//            guard let strongSelf = self else {
//                return
//            }
//
//            guard !exists else {
//                self?.alertUserLoginError(message: "Looks like a user account for that email address already exists.")
//                return
//            }
//
//            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
//
//                guard authResult != nil, error == nil else {
//                    print("Error cureating user")
//                    return
//                }
//
//                DatabaseManager.shared.insertUser(with: ChatAppUser(firstName: firstName, lastName: lastName, emailAddress: email))
//
//                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
//            })
//
//        })
        
    }
    
    func openHome(controller: UIViewController) {
        let viewModel = LoginViewModel()
        let controllerLogin = LoginController(viewModel: viewModel)
        controller.navigationController?.pushViewController(controllerLogin, animated: true)
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

//extension RegisterViewModel: RegisterProtocol {
//    var clickRegisterObserver: Observable<Bool> {
//        
//    }
//    
//    func finishRegister(controller: UIViewController) {
//        
//    }
//    
//    func openErrorPassword(controller: UIViewController) {
//        
//    }
//    
//    func openErrorBlanked(controller: UIViewController) {
//        
//    }
//    
//    func registerFirebase(email: String, password: String, confirmPassword: String) {
//        
//    }
//    
//    
//}
