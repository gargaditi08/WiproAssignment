//
//  DetailTableViewController.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 06/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController {

    var selectedItem : Rows?
    let updatesImageView: AsyncImageView = {
        let img = AsyncImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
           }()
    
    let descriptionLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 15.0)
           label.textColor = .darkGray
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
              }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      initializeUI()
    }
    
    func initializeUI(){
        self.navigationItem.title = selectedItem?.title
        self.view.backgroundColor = .white
        view.addSubview(updatesImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        updateConstraints()
    }
    
    func updateConstraints()
    {
        updatesImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        updatesImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
       updatesImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        updatesImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        updatesImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
       // updatesImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -80).isActive = true
        
          
         titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
         titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
         titleLabel.topAnchor.constraint(equalTo: updatesImageView.bottomAnchor,constant: 10).isActive = true
        
        
        
        
          descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
           descriptionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        
           descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10).isActive = true
         descriptionLabel.numberOfLines = 0
        
         bindData()

}

    func bindData(){
        
        guard let updatesItem = selectedItem  else{return}
        if let name = updatesItem.title{
            titleLabel.text = name
        }
        
        if let imageURL = updatesItem.imageHref{
           
            updatesImageView.loadAsyncFrom(url: imageURL, placeholder: Utils.placeholderImg)
               }
        
        if let description = updatesItem.description{
                   descriptionLabel.text = description
               }
    }
}
