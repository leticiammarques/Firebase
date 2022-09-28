//
//  LoginView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import SnapKit

class LoginView: BaseView {
    
    var imgTop: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "top")
        return img
    }()
    
    var logo: UIImageView = {
        let lg = UIImageView()
        lg.image = UIImage(named: "logo")
        return lg
    }()
    
    var title: UILabel = {
        let tl = UILabel()
        tl.text = "PrivieLegius"
        tl.font = UIFont.boldSystemFont(ofSize: 26)
        tl.textColor = .black
        tl.numberOfLines = 0
        return tl
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
        field.textColor = .black
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
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        field.isSecureTextEntry = true
        return field
    }()
    
    var btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Roboto", size: 12)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor(named: "rosa")
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
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
        self.addSubview(title)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(btnLogin)
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
            logo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            logo.heightAnchor.constraint(equalToConstant: 55),
            logo.widthAnchor.constraint(equalToConstant: 55)
        ])
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
            title.centerYAnchor.constraint(equalTo: logo.centerYAnchor)
        ])
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 70),
            emailField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            emailField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 23),
            passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            passwordField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnLogin.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            btnLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            btnLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            btnLogin.heightAnchor.constraint(equalToConstant: 40)
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
