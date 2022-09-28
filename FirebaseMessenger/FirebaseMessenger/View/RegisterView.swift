//
//  RegisterView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import SnapKit

class RegisterView: BaseView {
    
    var imgTop: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "top")
        return img
    }()
    
    var logo: UIImageView = {
        let lg = UIImageView()
        lg.image = UIImage(named:"person.circle")
        return lg
    }()
    
    var firstNameField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.black.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        return field
    }()
    
    var secondNameField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.black.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Sobrenome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        return field
    }()
    
    var emailField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.black.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        return field
    }()
    
    var passwordField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.black.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        return field
    }()
    
    var confirmPasswordField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.black.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Confirme a senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        return field
    }()
    
    var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cadastro", for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Roboto", size: 12)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor(named: "azul")
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    var imgBottom: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bottom")
        return img
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(imgTop)
        self.addSubview(logo)
        self.addSubview(firstNameField)
        self.addSubview(secondNameField)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(confirmPasswordField)
        self.addSubview(registerButton)
        self.addSubview(imgBottom)
        
        self.backgroundColor = .white
        
        imgTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgTop.topAnchor.constraint(equalTo: self.topAnchor),
            imgTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imgTop.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imgTop.heightAnchor.constraint(equalToConstant: 74)
        ])
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.topAnchor.constraint(equalTo: imgTop.bottomAnchor, constant: 19),
            logo.heightAnchor.constraint(equalToConstant: 90),
            logo.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstNameField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstNameField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 30),
            firstNameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            firstNameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            firstNameField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        secondNameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondNameField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secondNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 13),
            secondNameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            secondNameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            secondNameField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: secondNameField.bottomAnchor, constant: 13),
            emailField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            emailField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 13),
            passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            passwordField.heightAnchor.constraint(equalToConstant: 30)
        ])

        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmPasswordField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 13),
            confirmPasswordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            confirmPasswordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        imgBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgBottom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imgBottom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imgBottom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imgBottom.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
}
