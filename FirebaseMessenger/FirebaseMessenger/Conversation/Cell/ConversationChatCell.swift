//
//  ConversationChatCell.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 30/09/22.
//

import Foundation
import UIKit
import RxSwift

class ConversationChatCell: UITableViewCell {
    static var customCell = "ConversationChatCell"
    
    var viewBody: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var photoPerson: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "zoro")
        iv.frame = CGRect(x: 0, y: 0, width: 52, height: 52)
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = iv.frame.width / 2
        return iv
    }()
    
    let namePerson: UILabel = {
       let label = UILabel()
        label.text = "Zorinho"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let mensagePerson: UILabel = {
       let label = UILabel()
        label.text = "Tu não quer saber o que aconteceu com meu olho?"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let hoursSend: UILabel = {
       let label = UILabel()
        label.text = "04:30"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    func setupViews() {
        
        self.addSubview(viewBody)
        viewBody.addSubview(photoPerson)
        viewBody.addSubview(namePerson)
        viewBody.addSubview(mensagePerson)
        viewBody.addSubview(hoursSend)

        viewBody.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewBody.topAnchor.constraint(equalTo: self.topAnchor),
            viewBody.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBody.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBody.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        photoPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoPerson.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            photoPerson.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            photoPerson.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            photoPerson.heightAnchor.constraint(equalToConstant: 52),
            photoPerson.widthAnchor.constraint(equalToConstant: 52)
        ])
        
        namePerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            namePerson.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            namePerson.leadingAnchor.constraint(equalTo: photoPerson.trailingAnchor, constant: 14)
        ])
        
        mensagePerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mensagePerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 6),
            mensagePerson.leadingAnchor.constraint(equalTo: photoPerson.trailingAnchor, constant: 14)
        ])
        
        hoursSend.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hoursSend.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            hoursSend.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            hoursSend.leadingAnchor.constraint(equalTo: mensagePerson.trailingAnchor, constant: 8)
        ])
    }
    
}
