//
//  ViewController.swift
//  DefaultAvatar
//
//  Created by Saadet Şimşek on 13/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var users = [String]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.bounces = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "İOS"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource =  self
        
        setupNavigationController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupNavigationController(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTap))
    }
    
    @objc private func didTap(){
        AlertManager.showTextFieldsAlert(vc: self,
                                         title: "Add user") {[weak self] name in
            guard let self else { return }
            self.users.append(name)
            addUser(users)
            tableView.reloadData()
        }
    }
    
    func addUser(_ user: [String]){
        self.users = user
    }
}
//MARK: -TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.configure(userName: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
