//
//  FirebaseMessengerView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import SnapKit

class FirebaseMessengerView: BaseView {
       
    var imageTop: UIImageView = {
        let imgTop = UIImageView()
        imgTop.image = UIImage(named: "top")
        return imgTop
    }()
    
    var txtTitle: UILabel = {
        let txt = UILabel()
        txt.text = "PrivieLegius"
        txt.font = UIFont.boldSystemFont(ofSize: 26)
        txt.numberOfLines = 0
        txt.textColor = .black
        return txt
    }()
    
    var imgLogo: UIImageView = {
        let lg = UIImageView()
        lg.image = UIImage(named: "logo")
        return lg
    }()
    
    var btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Roboto", size: 12)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor(named: "rosa")
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    var btnCadastro: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cadastro", for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Roboto", size: 12)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor(named: "azul")
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    var imageBottom: UIImageView = {
        let imgBottom = UIImageView()
        imgBottom.image = UIImage(named: "bottom")
        return imgBottom
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(imageTop)
        self.addSubview(txtTitle)
        self.addSubview(imgLogo)
        self.addSubview(btnLogin)
        self.addSubview(btnCadastro)
        self.addSubview(imageBottom)
        
        self.backgroundColor = .white
        
        imageTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageTop.topAnchor.constraint(equalTo: self.topAnchor),
            imageTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageTop.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageTop.heightAnchor.constraint(equalToConstant: 74)
        ])
        
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            txtTitle.topAnchor.constraint(equalTo: imageTop.topAnchor, constant: 146),
            txtTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
        
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgLogo.centerYAnchor.constraint(equalTo: txtTitle.centerYAnchor),
            imgLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            imgLogo.trailingAnchor.constraint(equalTo: txtTitle.leadingAnchor, constant: -14),
            imgLogo.heightAnchor.constraint(equalToConstant: 88),
            imgLogo.widthAnchor.constraint(equalToConstant: 88)
        ])
        
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnLogin.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 80),
            btnLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            btnLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            btnLogin.heightAnchor.constraint(equalToConstant: 40)
        ])

        btnCadastro.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnCadastro.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnCadastro.topAnchor.constraint(equalTo: btnLogin.bottomAnchor, constant: 14),
            btnCadastro.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            btnCadastro.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            btnCadastro.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        imageBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageBottom.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageBottom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageBottom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageBottom.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
    
}
