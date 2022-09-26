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
        lg.image = UIImage(named: "logo")
        return lg
    }()
    
    var title: UILabel = {
        let tl = UILabel()
        tl.text = "PrivieLegius"
        tl.font = UIFont.boldSystemFont(ofSize: 24)
        tl.textColor = .white
        tl.numberOfLines = 0
        return tl
    }()
    
    var firstNameField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 5
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.white.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "txtField")
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
        field.layer.borderColor = UIColor.white.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Sobrenome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "txtField")
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
        field.layer.borderColor = UIColor.white.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "txtField")
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
        field.layer.borderColor = UIColor.white.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "txtField")
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
        field.layer.borderColor = UIColor.white.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Confirme a senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field.textColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(named: "txtField")
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
        self.addSubview(title)
        self.addSubview(firstNameField)
        self.addSubview(secondNameField)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(confirmPasswordField)
        self.addSubview(registerButton)
        self.addSubview(imgBottom)
        
        self.backgroundColor = .black
        
        imgTop.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(74)
        }
        
        logo.snp.makeConstraints{
            $0.left.equalToSuperview().offset(56)
            $0.width.height.equalTo(55)
        }
        
        title.snp.makeConstraints{
            $0.left.equalTo(logo.snp.right).offset(14)
            $0.right.equalToSuperview().offset(-56)
            $0.centerY.equalTo(logo.snp.centerY)
        }
        
        firstNameField.snp.makeConstraints{
            $0.top.equalTo(logo.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(64)
            $0.right.equalToSuperview().offset(-64)
            $0.height.equalTo(30)
        }
        
        secondNameField.snp.makeConstraints{
            $0.top.equalTo(firstNameField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(64)
            $0.right.equalToSuperview().offset(-64)
            $0.height.equalTo(30)
        }
        
        emailField.snp.makeConstraints{
            $0.top.equalTo(secondNameField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(64)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-64)
            $0.height.equalTo(30)
        }
        
        passwordField.snp.makeConstraints{
            $0.top.equalTo(emailField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(64)
            $0.right.equalToSuperview().offset(-64)
            $0.height.equalTo(30)
        }
        
        confirmPasswordField.snp.makeConstraints{
            $0.top.equalTo(passwordField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(64)
            $0.right.equalToSuperview().offset(-64)
            $0.height.equalTo(30)
        }
        
        registerButton.snp.makeConstraints{
            $0.top.equalTo(confirmPasswordField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(80)
            $0.right.equalToSuperview().offset(-80)
            $0.height.equalTo(40)
        }
        
        imgBottom.snp.makeConstraints{
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
}
