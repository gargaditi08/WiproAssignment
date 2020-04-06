//
//  ViewController.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 05/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 var tableView = UITableView()
    
    var viewModel = UpdatesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Canada Updates"
        
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UpdateTableViewCell.self, forCellReuseIdentifier: "updateCell")
        
        self.viewModel.getUpdateList()
        
        self.viewModel.reloadData = {
            self.tableView.reloadData()
        }
        
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "updateCell", for: indexPath) as? UpdateTableViewCell else {return UITableViewCell()}
        cell.updates = self.viewModel.updateAtIndex(index: indexPath.row)
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100.0
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

