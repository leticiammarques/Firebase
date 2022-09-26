//
//  BaseView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 16/09/22.
//

import Foundation
import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    private func setupLayout() {
        backgroundColor = UIColor.white
    }
}
