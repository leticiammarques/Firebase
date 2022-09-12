//
//  ViewController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import UIKit

class FirebaseMessengerController: UIViewController {
    
    let customView: FirebaseMessengerView = FirebaseMessengerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.btnCadastro.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        customView.btnLogin.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        self.setUp()
    }

    func setUp() {
        self.view.addSubview(customView)
        customView.snp.makeConstraints{
            $0.bottom.top.left.right.equalToSuperview()
        }
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapLogin() {
        let vc = LoginController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

