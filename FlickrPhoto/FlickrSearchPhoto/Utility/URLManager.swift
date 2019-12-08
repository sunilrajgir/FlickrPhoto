//
//  URLManager.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class URLManager: NSObject {
    internal class func getImageUrl() -> String {
        return Constant.imageUrl
    }
    
    internal class func getListUrl() -> String {
        return Constant.flickrURl
    }
    
}
