//
//  PhotoViewController.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    let searchBar = UISearchBar(frame: CGRect(x: 50, y: 0, width: UIScreen.main.bounds.size.width-200, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigation()
    }
    
    func setUpNavigation() {
        self.searchBar.placeholder = "Enter Text"
        self.navigationItem.titleView = self.searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(searchButtonAction))
    }
    
    @objc func searchButtonAction() {
        if let inputText = self.searchBar.text, inputText.count > 0 {
            
        }
        self.searchBar.searchTextField.resignFirstResponder()
    }
}
