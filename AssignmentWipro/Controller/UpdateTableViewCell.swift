//
//  UpdateTableViewCell.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 06/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {
    
    var updates : Rows? {
        didSet{
            guard let listItem = updates else  {return}
            
            if let title = listItem.title{
                titleLabel.text = title
        }
        updatesImageView.image = nil
        if let imageURL = listItem.imageHref {
            
            updatesImageView.loadAsyncFrom(url: imageURL, placeholder: nil)
        }
        if let description = listItem.description{
            descriptionLabel.text = description
        }
    }
}
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    let updatesImageView: AsyncImageView = {
        let img = AsyncImageView()
        img.backgroundColor = UIColor.red
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()

    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(updatesImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        self.contentView.addSubview(containerView)
        
        
        updatesImageView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
        updatesImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        updatesImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        updatesImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
}
}
