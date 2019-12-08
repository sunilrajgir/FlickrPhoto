//
//  Presenter.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Presenter {
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
  
    func resetToDefaultState() {
        
    }
    
    func showFetchedData(photoModel: Any) {
        self.viewModel.showData(data: photoModel)
    }
    
    func showNextPageData(photoModel:Any)  {
        self.viewModel.showNextPageData(data: photoModel)
    }
}
