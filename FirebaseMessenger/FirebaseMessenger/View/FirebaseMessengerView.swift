//
//  FirebaseMessengerView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import SnapKit

class FirebaseMessengerView: UIView {
       
    var imageTop: UIImageView = {
        let imgTop = UIImageView()
        imgTop.image = UIImage(named: "top")
        return imgTop
    }()
    
    var text: UILabel = {
        let txt = UILabel()
        txt.text = "PrivieLegius"
        txt.font = UIFont.boldSystemFont(ofSize: 26)
        txt.numberOfLines = 0
        txt.textColor = .white
        return txt
    }()
    
    var logo: UIImageView = {
        let lg = UIImageView()
        lg.image = UIImage(named: "logo")
        return lg
    }()
    
    var btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Roboto", size: 12)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor(named: "rosa")
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    var btnCadastro: UIButton = {
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
        self.addSubview(text)
        self.addSubview(logo)
        self.addSubview(btnLogin)
        self.addSubview(btnCadastro)
        self.addSubview(imageBottom)
        
        self.backgroundColor = .black
        
        imageTop.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(74)
        }
        
        text.snp.makeConstraints{
            $0.top.equalTo(imageTop.snp.bottom).offset(146)
            $0.right.equalToSuperview().offset(-32)
        }
        
        logo.snp.makeConstraints{
            $0.centerY.equalTo(text.snp.centerY)
            $0.left.equalToSuperview().offset(32)
            $0.right.equalTo(text.snp.left).offset(-14)
            $0.height.width.equalTo(88)
        }
        
        btnLogin.snp.makeConstraints{
            $0.top.equalTo(logo.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(80)
            $0.right.equalToSuperview().offset(-80)
            $0.height.equalTo(40)
        }
        
        btnCadastro.snp.makeConstraints{
            $0.top.equalTo(btnLogin.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(80)
            $0.right.equalToSuperview().offset(-80)
            $0.height.equalTo(40)
        }
        
        imageBottom.snp.makeConstraints{
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
    
}
