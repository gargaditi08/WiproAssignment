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
        tableView.backgroundColor = UIColor.lightGray
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UpdateTableViewCell.self, forCellReuseIdentifier: "updateCell")
        
        self.initializeViewModel()
        
    }
    
    func initializeViewModel(){
        self.viewModel.getUpdateList()
        self.viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        
    }
        self.viewModel.apiErrorOccured =  { [weak self] (error : String) in
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                strongSelf.showAlertScreen(nil, message: error, alertTitle:"OK", responseHandler:nil)
            }
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
        return UITableView.automaticDimension
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = DetailTableViewController()
        detailController.selectedItem = self.viewModel.updateAtIndex(index: indexPath.row)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

extension UIViewController {
    typealias AlertActionHandler = ()-> Void
    
    func showAlertScreen(_ title: String?, message: String?, alertTitle : String?, responseHandler : AlertActionHandler?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction  = UIAlertAction(title: alertTitle, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
        responseHandler?()
    })
    alert.addAction(okAction)
    present(alert, animated: true)

}
}
