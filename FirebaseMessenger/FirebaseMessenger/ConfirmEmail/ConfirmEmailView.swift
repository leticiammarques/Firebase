//
//  ConfirmEmailView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 14/10/22.
//

import UIKit

class ConfirmEmailView: BaseView {
    
    var mensageInfo: UILabel = {
        let lbl = UILabel()
        lbl.text = PriviLegiusLocalized.confirmEmail
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
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
        field.attributedPlaceholder = NSAttributedString(string: PriviLegiusLocalized.email, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor.clear
        return field
    }()
    
    var btnConfirm: UIButton = {
        let btn = UIButton()
        btn.setTitle(PriviLegiusLocalized.btnConfirm, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor(named: "rosa")
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(mensageInfo)
        self.addSubview(emailField)
        self.addSubview(btnConfirm)
        
        mensageInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mensageInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mensageInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            mensageInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 130)
        ])
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: mensageInfo.bottomAnchor, constant: 51),
            emailField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            emailField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        btnConfirm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnConfirm.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnConfirm.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 36),
            btnConfirm.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            btnConfirm.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            btnConfirm.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
