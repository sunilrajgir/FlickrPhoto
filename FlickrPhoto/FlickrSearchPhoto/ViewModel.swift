//
//  ViewModel.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class ViewModel {
    /* There are only 4 state of view [default, loader, connection error, server error] */
    /* for now we have only one state*/
    private var isCollectionViewHidden =  false
    private var totalRecords = 0
    
    private var sourceArray = [FlickrImageModel]()
    weak var delegate: ViewModelProtocol?
    
    internal func initialSetup(completion :(()->(Void))) {
        self.isCollectionViewHidden = false
        completion()
    }

// MARK:- View Interface
    internal func getIsCollectionViewHidden() -> Bool {
        return self.isCollectionViewHidden
    }
    
    internal func numberOfSection()->Int {
        return self.sourceArray.count>0 ? 1 : 0
    }
    
    internal func numberOfItemsInSection(section: Int)-> Int {
        if self.totalRecords > self.sourceArray.count {
            return self.sourceArray.count+1
        } else {
            return self.sourceArray.count
        }
    }
    
    internal func getImageModel(row:Int)->FlickrImageModel? {
        if row < self.sourceArray.count {
            return self.sourceArray[row]
        } else {
            return nil
        }
    }
    
// MARK:- Presenter Interface
    internal func showData(data:Any?) {
        if let photoModel = data as? FlickrModel {
            self.sourceArray = photoModel.photos!.photo
            self.totalRecords = Int(photoModel.photos?.total ?? "") ?? 0
            self.delegate?.showData()
        }
    }
    
    internal func showNextPageData(data:Any?)  {
        if let photoModel = data as? FlickrModel {
            self.sourceArray.append(contentsOf: photoModel.photos!.photo)
            self.delegate?.showData()
        }
    }
    
    internal func resetView() {
        self.sourceArray.removeAll()
        self.totalRecords = 0
        self.delegate?.showData()
    }
    
    internal func showError(error:Error) {
        // out of score, will implement view 3 more state[loader, connection error, server error]
    }
}
