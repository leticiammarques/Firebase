//
//  DatabaseManager.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 04/10/22.
//

import Foundation
import FirebaseDatabase
import UIKit

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
}

extension DatabaseManager {
    
    public func userExists(with email: String, completion: @escaping((Bool) -> Void)) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                print("teste \(completion(false))")
                completion(false)
                return
            }
            print("teste \(completion(true))")
            completion(true)
        })
    }
    
    public func insertUser(with user: ChatAppUser) {
        database.child(user.firstName).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email_adress": user.emailAddress,
            "password": user.password
        ])
    }
}


struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    let password: String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}
