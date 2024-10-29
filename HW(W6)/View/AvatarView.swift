//
//  AvatarView.swift
//  HW(W6)
//
//  Created by Amankeldi Zhetkergen on 22.10.2024.
//

import UIKit

class AvatarView: UIView {
    
    let firstLetterLabel: UILabel = {
       let fl = UILabel()
        fl.text = "?"
        fl.textColor = .systemGray3
        fl.font = .systemFont(ofSize: 12)
        fl.textAlignment = .center
        fl .translatesAutoresizingMaskIntoConstraints = false
        return fl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with name: String, backgroundColor: UIColor) {
        firstLetterLabel.text = name.first?.uppercased()
        self.backgroundColor = backgroundColor
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        backgroundColor = .blue
        
        addSubview(firstLetterLabel)
        
        NSLayoutConstraint.activate([
            firstLetterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstLetterLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
