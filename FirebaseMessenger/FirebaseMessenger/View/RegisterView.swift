//
//  RegisterView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    var imgTop: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "top")
        return img
    }()
    
    
    
    var imgBottom: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bottom")
        return img
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(imgTop)
        
        self.addSubview(imgBottom)
        
        self.backgroundColor = .black
        
        imgTop.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(74)
        }
        
        
        imgBottom.snp.makeConstraints{
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
}
