//
//  ChatController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 05/10/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

protocol ChatProtocol {
    
}

class ChatController: BaseViewController<ChatView> {
    
    var viewModel: ChatProtocol {
        return baseViewModel as! ChatProtocol
    }
    
    var photo: UIImage!
    var name: String!
    var menssage: String!
    
//    init(photo: String, name: String, menssage: String) {
//        super.init(viewModel: viewModel as! BaseViewModelProtocol, nibName: "ChatView")
//        self.photo = UIImage(named: photo)
//        self.name = name
//        self.menssage = menssage
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
