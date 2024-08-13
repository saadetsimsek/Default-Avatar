//
//  CustomTableViewCell.swift
//  DefaultAvatar
//
//  Created by Saadet Şimşek on 13/08/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    private let avatarLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 30
        return label
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarLabel)
        addSubview(nameLabel)
        
        addConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(userName: String){
        nameLabel.text = userName
        avatarLabel.text = userName.getFirstSembols()
    }
    
    private func addConstraits(){
        NSLayoutConstraint.activate([
            avatarLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            avatarLabel.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarLabel.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
