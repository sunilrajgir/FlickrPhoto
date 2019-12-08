//
//  URLCacheManager.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class URLCacheManager {
    internal static let shared = URLCacheManager()
    private var dataCache = NSCache<NSString, AnyObject>()
    
    internal func getDataForKey(key:NSString)->AnyObject? {
        return self.dataCache.object(forKey: key)
    }
    
    internal func addDataToCache(data:AnyObject,key:NSString) {
        self.dataCache.setObject(data, forKey: key)
    }
}


