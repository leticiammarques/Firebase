//
//  ConversationsView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import RxSwift
import UIKit

class ConversationsView: BaseView {
    
    
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        
        self.backgroundColor = .red
        
    }
}
