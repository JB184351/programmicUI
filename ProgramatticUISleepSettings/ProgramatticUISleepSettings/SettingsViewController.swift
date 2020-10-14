//
//  ViewController.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/10/20.
//

import UIKit

class SettingsViewController: UIViewController {

    var tableView = UITableView()
    var sleepLabel = UILabel()
    var settingsDataSource = [[SettingsProtocol]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(sleepLabel)
        view.addSubview(tableView)
        
        sleepLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        sleepLabel.text = "Sleep Settings"
        sleepLabel.textAlignment = .center
    }
    
    func setupConstraints() {
        sleepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        sleepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        sleepLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: sleepLabel.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }


}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return settingsDataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension SettingsViewController: UITableViewDelegate {
    
}

