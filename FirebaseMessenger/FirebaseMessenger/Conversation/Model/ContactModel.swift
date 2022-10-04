//
//  Contact.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 03/10/22.
//

import Foundation

struct ContactModel {
    let photo: String
    let name: String
    let mensage: String
    let time: String
    
    init(photo: String, name: String, mensage: String, time: String) {
        self.photo = photo
        self.name = name
        self.mensage = mensage
        self.time = time
    }
}
