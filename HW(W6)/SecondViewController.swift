//
//  SecondViewController.swift
//  HW(W6)
//
//  Created by Amankeldi Zhetkergen on 22.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let person : Person
    private let peopleDatabaseService : PeopleDatabaseService
    
    let avatarView = AvatarView()
    
    let nameLabel : UILabel = {
        let nl = UILabel()
        nl.text = "Name"
        nl.textColor = .black
        nl.textAlignment = .center
        nl.font = .systemFont(ofSize: 40, weight: .bold)
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    let label: UILabel = {
        let nl = UILabel()
        nl.text = "Choose the avatar color"
        nl.textColor = .black
        nl.textAlignment = .center
        nl.font = .systemFont(ofSize: 25)
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    let stack1stRowButtons : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let stack2ndRowButtons : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let stackOfButtons : UIStackView = {
       let sb = UIStackView()
        sb.axis = .vertical
        sb.distribution = .equalSpacing
        sb.spacing = 20
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    init(person: Person, peopleDatabaseService: PeopleDatabaseService) {
        self.person = person
        self.peopleDatabaseService = peopleDatabaseService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUIData()
    }
    
    func updateUIData() {
        avatarView.update(with: person.name, backgroundColor: person.color)
        nameLabel.text = person.name
    }

    func setupUI() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(avatarView)
        view.addSubview(nameLabel)
        view.addSubview(label)
        view.addSubview(stackOfButtons)
        stackOfButtons.addArrangedSubview(stack1stRowButtons)
        stackOfButtons.addArrangedSubview(stack2ndRowButtons)
        
        setupButtons()
        
        avatarView.layer.cornerRadius = 100
        avatarView.firstLetterLabel.font = .systemFont(ofSize: 80, weight: .bold)
        
        NSLayoutConstraint.activate([
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatarView.heightAnchor.constraint(equalToConstant: 200),
            avatarView.widthAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.bottomAnchor.constraint(equalTo: stackOfButtons.topAnchor, constant: -25),
            
            stackOfButtons.heightAnchor.constraint(equalToConstant: 180),
            stackOfButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackOfButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackOfButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    func setupButtons() {
        for i in 0...3 {
            let button1 = createButton(with: peopleDatabaseService.getColor(with: i), and: i)
            let button2 = createButton(with: peopleDatabaseService.getColor(with: i+4), and: i+4)
            
            stack1stRowButtons.addArrangedSubview(button1)
            stack2ndRowButtons.addArrangedSubview(button2)
            
            NSLayoutConstraint.activate([
                        button1.heightAnchor.constraint(equalToConstant: 80),
                        button1.widthAnchor.constraint(equalToConstant: 80),
                        
                        button2.heightAnchor.constraint(equalToConstant: 80),
                        button2.widthAnchor.constraint(equalToConstant: 80)
                    ])
        }
    }

    func createButton(with color: UIColor, and tag: Int) -> UIButton {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 40
        button.backgroundColor = color
        button.tag = tag
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return button
    }

    @objc func buttonTapped(sender: UIButton) {
        avatarView.backgroundColor = sender.backgroundColor
        peopleDatabaseService.updatePersonInfo(with: person.name, color: sender.backgroundColor ?? UIColor.white)
    }
}

