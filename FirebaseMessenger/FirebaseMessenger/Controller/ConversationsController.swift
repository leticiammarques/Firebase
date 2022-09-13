//
//  ConversationsController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import FirebaseAuth
import RxSwift

class ConversationsController: UIViewController {
    
    let customView: ConversationsView = ConversationsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.setUp()
    }

    func setUp() {
        self.view.addSubview(customView)
        customView.snp.makeConstraints{
            $0.bottom.top.left.right.equalToSuperview()
        }
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        validateAuth()
    
    }
    
//    private func validateAuth() {
//        if FirebaseAuth.Auth.auth().currentUser == nil {
//            let vc = LoginController()
//            let nav = UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: false)
//        }
//    }
}
