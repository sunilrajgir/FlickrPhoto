//
//  PhotoViewModel.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class ViewModel {
    
    private var isCollectionViewHidden =  false
    private var totalRecords = 0
    
    private var sourceArray = [FlickrURLs]()
    weak var viewDelegate: PhotoViewModelProtocol?
    
    internal func initialSetup(completion :(()->(Void))) {
        self.isCollectionViewHidden = false
        completion()
    }
    
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
    
    internal func getImageModel(row:Int)->FlickrURLs? {
        if row < self.sourceArray.count {
            return self.sourceArray[row]
        } else {
            return nil
        }
    }
        
    internal func showData(data:Any) {
        if let photoModel = data as? FlickrModel {
            self.sourceArray = photoModel.photos!.photo
            self.totalRecords = Int(photoModel.photos?.total ?? "") ?? 0
            self.viewDelegate?.showData(array: self.sourceArray)
        }
    }
    
    internal func showNextPageData(data:Any)  {
        if let photoModel = data as? FlickrModel {
            self.sourceArray.append(contentsOf: photoModel.photos!.photo)
            self.viewDelegate?.showData(array: self.sourceArray)
        }
    }
}
