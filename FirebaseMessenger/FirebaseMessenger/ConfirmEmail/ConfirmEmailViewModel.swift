//
//  ConfirmEmailViewModel.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 14/10/22.
//

import UIKit
import RxCocoa
import RxSwift
import FirebaseAuth

class ConfirmEmailViewModel: BaseViewModel {
    private let verificatedEmail: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let verificatedIsEmptyRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let clickVericatedRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let clickNotVericatedRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    private func verificated(email: String) {
        guard !email.isEmpty else {
            print("email/senha não podem estar vazios")
            self.verificatedIsEmptyRelay.accept(true)
            return
        }
        
        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exist in
            
            guard !exist else {
                
                FirebaseAuth.Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        let controller = ConfirmEmailController(viewModel: self!)
                        controller.openModalSimple(title: "Erro", body: error.localizedDescription, titleBtn: PriviLegiusLocalized.back)
                        return
                    }
                    self?.clickVericatedRelay.accept(true)
                }
                return
            }
            
            self?.clickNotVericatedRelay.accept(true)
        })
    }
}

extension ConfirmEmailViewModel: ConfirmEmailProtocol {
   
    func verifyEmail(email: String) {
        self.verificated(email: email)
    }
    
    var clickVericatedObserver: Observable<Bool> {
        self.clickVericatedRelay.asObservable()
    }
    
    var vericatedIsEmptyObserver: Observable<Bool> {
        self.verificatedIsEmptyRelay.asObservable()
    }
    
    var clickNotVericatedObserver: Observable<Bool> {
        self.clickNotVericatedRelay.asObservable()
    }
}
