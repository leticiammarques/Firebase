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

    private func didTapRegister(controller: UIViewController) {
        let viewModel = RegisterViewModel()
        let controllerRegister = RegisterController(viewModel: viewModel)
        controller.navigationController?.pushViewController(controllerRegister, animated: true)
    }
    
    private func didTapLogin(controller: UIViewController) {
        let viewModel = LoginViewModel()
        let controllerLogin = LoginController(viewModel: viewModel)
        controller.navigationController?.pushViewController(controllerLogin, animated: true)
    }
}

extension FirebaseMessengerViewModel: FirebaseMessengerProtocol {
    func tapRegister(controller: UIViewController) {
        self.didTapRegister(controller: controller)
    }
    
    func tapLogin(controller: UIViewController) {
        self.didTapLogin(controller: controller)
    }
    
}
