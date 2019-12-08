//
//  PhotoInteractor.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

enum ResponseState {
    case SUCCESS
    case SERVER_FAILURE
    case OFFLINE
}

internal class Interactor {

    private let dataGateway : DataFetcher
    private let flickerModel : FlickrModel.Type
    
    init(dataGateway : DataFetcher, flickerModel : FlickrModel.Type) {
        self.dataGateway = dataGateway
        self.flickerModel = flickerModel
    }
    
    internal func fetchData(url: URL, completionBlock:@escaping((_ data:Any?, _ error:Error?)->Void))  {
        self.dataGateway.loadUrlContent(url: url) { (data, error) in
            if error == nil {
            do
            {
                let flickrPhotos = try JSONDecoder().decode(FlickrModel.self, from: data!)
                //print(flickrPhotos)
                completionBlock(flickrPhotos, nil)
            } catch {
                //print(error.localizedDescription)
                completionBlock(nil,error)
            }
            } else {
                completionBlock(nil,error)
            }
        }
    }
}






