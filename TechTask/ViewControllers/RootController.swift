//
//  RootController.swift
//  TechTask
//
//  Created by MAC on 03/07/19.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import SDWebImage
import SVProgressHUD

class RootController: UIViewController {

    lazy var tableView:UITableView = {
       
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
        
    }()
    
    var rows = [Row]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupTableView()
        populateData()
    }
    
    //MARK: - setupTableView
    func setupTableView(){
        
        tableView.register(RootCell.self, forCellReuseIdentifier: "RootCell")
       
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - Populate data
    func populateData(){
        
        let urlString = Constants.ABOUT_API
        
        SVProgressHUD.show()
        
        APIClient.shared.loadData(urlString: urlString) { (result) in
            
            SVProgressHUD.dismiss()
            
            switch result{
            case .success(let canada):
                
                //compact return array of non nil values
                self.rows = canada.rows.compactMap{$0}
                
                //update UI in the main thread
                DispatchQueue.main.async {
                    self.navigationItem.title = canada.title
                    self.tableView.reloadData()
                }
                
                break
            case .failure(let error):
                print(error.toString())
                break
            }
            
        }
    }

}


