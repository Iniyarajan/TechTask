//
//  RootCell.swift
//  TechTask
//
//  Created by MAC on 03/07/19.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import SDWebImage

class RootCell: UITableViewCell {

    lazy var thumbnailImageView:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    lazy var descLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.gray
        return lbl
        
    }()
    
    lazy var titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK:- Setup sub views
    func setupSubViews(){
        setupThumbnailImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        
    }
    
    //MARK:- Setup thumbnail image view
    func setupThumbnailImageView(){
//        thumbnailImageView.backgroundColor = UIColor.green
        addSubview(thumbnailImageView)
        thumbnailImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thumbnailImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -15).isActive = true
    }
    
    //MARK:- Setup title label
    func setupTitleLabel(){
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        titleLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .vertical)
       
    }
    
    //MARK:- Setup desc labl
    func setupDescriptionLabel(){
        addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        descLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        descLabel.sizeToFit()
       
    }
    
    func configureCell(row:Row?){
        
        descLabel.text = row?.rowDescription ?? ""
        titleLabel.text = row?.title ?? ""
        let imgUrl = row?.thumbnailImage ?? ""
//        thumbnailImageView.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "placeholder"))

        thumbnailImageView.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions.refreshCached, progress: nil, completed: { (image, error, cache, url) in
              if error == nil {
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                 
             }
        })
    }

}

