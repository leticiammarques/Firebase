//
//  FirebaseMessengerViewModel.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 13/09/22.
//

import UIKit
import RxCocoa
import RxSwift

class FirebaseMessengerViewModel: NSObject {
    
    var controller = FirebaseMessengerController()
    
    private func didTapRegister() {
        let vc = RegisterController()
        controller.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func didTapLogin() {
        let vc = LoginController()
        controller.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirebaseMessengerViewModel: FirebaseMessengerProtocol {
    func tapRegister() {
        self.didTapRegister()
    }
    
    func tapLogin() {
        self.didTapLogin()
    }
    
    
}
