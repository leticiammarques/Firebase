//
//  LoginController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import SnapKit
import FirebaseAuth

class LoginController: UIViewController {
    
    let customView: LoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.btnLogin.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        
        self.setUp()
    }

    func setUp() {
        self.view.addSubview(customView)
        customView.snp.makeConstraints{
            $0.bottom.top.left.right.equalToSuperview()
        }
    }
    
    @objc private func loginUser() {
        
        customView.emailField.resignFirstResponder()
        customView.passwordField.resignFirstResponder()
        
        guard let email = customView.emailField.text, let password = customView.passwordField.text, password.count >= 6 else {
            print("email/senha não podem estar vazios")
            alertUserLoginError()
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] authResult, error in
            
            guard let strongSelf = self else {
                return
            }
            
            guard let result = authResult, error == nil else {
                print("Falha no login do usuário do email: \(email)")
                return
            }
            
            let user = result.user
            print("Login do usuário \(user)")
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Oooopa", message: "Por favor, insira todas as informações para fazer login.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
