//
//  HomeView.swift
//  HW(W6)
//
//  Created by Amankeldi Zhetkergen on 23.10.2024.
//

import UIKit

protocol HomeViewDelegate {
    func didSelectRow(at indexPath: Int)
}

final class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    
    private var contents: [Person] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(contents: [Person]) {
        self.contents = contents
        tableView.reloadData()
    }
    
    func updatedPersonInformation(newContents: [Person]) {
        self.contents = newContents
        tableView.reloadData()
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomCell.identifier,
            for: indexPath
        ) as? CustomCell else {
            return UITableViewCell()
        }
        cell.configure(with: contents[indexPath.row].name, and: contents[indexPath.row].color)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectRow(at: indexPath.row)
    }
}

extension HomeView {
    private func setupSubviews() {
        addSubviews()
        setupSubviewsConstraints()
        addSubviewsStyles()
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupSubviewsConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func addSubviewsStyles() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
}
