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
    
    var viewUser: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(named: "rosa")
        return vw
    }()

    var photoProfile: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "luffy")
        photo.frame = CGRect(x: 0, y: 0, width: 52, height: 52)
        photo.contentMode = .scaleAspectFit
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = photo.frame.width / 2
        return photo
    }()
    
    var titleName: UILabel = {
        let title = UILabel()
        title.text = "Monkey D. Luffy"
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.numberOfLines = 0
        return title
    }()
    
    var viewStatus: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor.systemGreen
        vw.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        vw.contentMode = .scaleAspectFit
        vw.layer.masksToBounds = true
        vw.layer.cornerRadius = vw.frame.width / 2
        return vw
    }()
    
    var titleStatus: UILabel = {
        let title = UILabel()
        title.text = PriviLegiusLocalized.online
        title.font = UIFont.boldSystemFont(ofSize: 12)
        title.textColor = UIColor(named: "status")
        title.numberOfLines = 0
        return title
    }()
    
    var chatTableView: UITableView = {
        let chat = UITableView()
        chat.register(ConversationChatCell.self, forCellReuseIdentifier: "ConversationChatCell")
        return chat
    }()
    
    var menuTabBar: UITabBar = {
        var tab = UITabBar()
        tab.setItems([UITabBarItem.init(title: PriviLegiusLocalized.menssage, image: UIImage.init(systemName: "bubble.right.fill"), tag: 0), UITabBarItem.init(title: PriviLegiusLocalized.newMenssage, image: UIImage.init(systemName: "plus.bubble.fill"), tag: 1), UITabBarItem.init(title: PriviLegiusLocalized.settings, image: UIImage.init(systemName: "gearshape.fill"), tag: 2)], animated: true)
        return tab
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(viewUser)
        viewUser.addSubview(photoProfile)
        viewUser.addSubview(titleName)
        viewUser.addSubview(viewStatus)
        viewUser.addSubview(titleStatus)
        self.addSubview(chatTableView)
        self.addSubview(menuTabBar)
        
        self.backgroundColor = .white
        
        
        viewUser.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewUser.topAnchor.constraint(equalTo: self.topAnchor),
            viewUser.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewUser.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewUser.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        photoProfile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoProfile.topAnchor.constraint(equalTo: self.topAnchor, constant: 23),
            photoProfile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            photoProfile.heightAnchor.constraint(equalToConstant: 52),
            photoProfile.widthAnchor.constraint(equalToConstant: 52)
        ])
        
        titleName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleName.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            titleName.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 16)
        ])
        
        viewStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 10),
            viewStatus.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 16),
            viewStatus.heightAnchor.constraint(equalToConstant: 10),
            viewStatus.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        titleStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStatus.centerYAnchor.constraint(equalTo: viewStatus.centerYAnchor),
            titleStatus.leadingAnchor.constraint(equalTo: viewStatus.trailingAnchor, constant: 8)
        ])
        
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: viewUser.bottomAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        menuTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuTabBar.topAnchor.constraint(equalTo: chatTableView.bottomAnchor),
            menuTabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuTabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuTabBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            menuTabBar.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
