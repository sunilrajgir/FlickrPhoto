//
//  ViewController.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        let vc = PhotoViewController(nibName: "PhotoViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

