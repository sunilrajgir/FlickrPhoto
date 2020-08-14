//
//  Presenter.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class Presenter {
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    internal func showFetchedData(photoModel: Any?, error: Error?) {
        if error == nil {
            self.viewModel.showData(data: photoModel)
        } else {
            
        }
    }
    
    internal func showNextPageData(photoModel:Any?, error: Error?)  {
        self.viewModel.showNextPageData(data: photoModel)
    }
    
    internal func resetScreen() {
        viewModel.resetView()
    }
}
