//
//  PhotoViewController.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class PhotoViewController: UIViewController {
    private let searchBar = UISearchBar(frame: CGRect(x: 50, y: 0, width: UIScreen.main.bounds.size.width-200, height: 20))
    private var photoView : View?
    internal var controller : Controller?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoView = self.view as? View
        self.photoView?.bind(controller: controller!)
        self.setUpNavigation()
    }
    
    private func setUpNavigation() {
        self.searchBar.placeholder = "Enter Text"
        self.navigationItem.titleView = self.searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(searchButtonAction))
    }
    
    @objc private func searchButtonAction() {
        if let inputText = self.searchBar.text, inputText.count > 0 {
            self.controller?.searchPhoto(text: inputText)
        }
        self.searchBar.searchTextField.resignFirstResponder()
    }
}
