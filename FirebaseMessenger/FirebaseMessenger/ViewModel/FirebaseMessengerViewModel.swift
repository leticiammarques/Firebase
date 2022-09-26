//
//  FirebaseMessengerViewModel.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 13/09/22.
//

import UIKit
import RxCocoa
import RxSwift

class FirebaseMessengerViewModel: BaseViewModel {

    private func didTapRegister() {

    }
    
    private func didTapLogin() {

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
