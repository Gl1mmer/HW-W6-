//
//  CustomCell.swift
//  HW(W6)
//
//  Created by Amankeldi Zhetkergen on 22.10.2024.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = String(describing: CustomCell.self)
    
    let avatarView = AvatarView()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Default"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with name: String, and color: UIColor) {
        nameLabel.text = name
        avatarView.update(with: name, backgroundColor: color)
    }
    private func setup() {
        addSubview(avatarView)
        addSubview(nameLabel)
        
        avatarView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 30),
            avatarView.widthAnchor.constraint(equalToConstant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
