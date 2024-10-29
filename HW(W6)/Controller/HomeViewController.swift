//
//  ViewController.swift
//  HW(W6)
//
//  Created by Amankeldi Zhetkergen on 20.10.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    let peopleDatabaseService = PeopleDatabaseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        homeView.configure(contents: peopleDatabaseService.getPeople())
        homeView.delegate = self
        peopleDatabaseService.delegate = self
    }
    
    func showSecondScreen(_ order: Int) {
        let secondVC = SecondViewController(person: peopleDatabaseService.getPeople()[order], peopleDatabaseService: peopleDatabaseService)
        secondVC.modalPresentationStyle = .popover
        present(secondVC, animated: true, completion: nil)
    }

    private func setupUI() {
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectRow(at indexPath: Int) {
        showSecondScreen(indexPath)
    }
}

extension HomeViewController: PeopleDatabaseServiceDelegate {
    func updatedPersonInfo() {
        homeView.updatedPersonInformation(newContents: peopleDatabaseService.getPeople())
    }
}

