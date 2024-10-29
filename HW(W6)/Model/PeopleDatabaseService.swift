//
//  PeopleDatabaseService.swift
//  HW(W6)
//
//  Created by Amankeldi Zhetkergen on 23.10.2024.
//

import UIKit

protocol PeopleDatabaseServiceDelegate {
    func updatedPersonInfo()
}

final class PeopleDatabaseService {
    
    var delegate: PeopleDatabaseServiceDelegate?
    
    private let colors: [UIColor] = [.cyan, .green, .blue, .red, .purple, .orange, .yellow, .magenta]
    
    private var people: [Person] = [
        Person(name: "Amankeldi", iin: 0, color: .blue),
        Person(name: "Aset", iin: 1, color: .orange),
        Person(name: "Dias", iin: 2, color: .red),
        Person(name: "Alexander", iin: 3, color: .green),
        Person(name: "Aldiyar", iin: 4, color: .purple)
    ]
    
    func getPeople() -> [Person] {
        return people
    }
    
    func updatePersonInfo(with name: String, color: UIColor) {
        guard let index = people.firstIndex(where: { $0.name == name }) else { return }
        people[index].color = color
        updateViews()
    }
    
    func getColor(with index: Int) -> UIColor {
        return colors[index]
    }
    
    func updateViews() {
        delegate?.updatedPersonInfo()
    }
}
