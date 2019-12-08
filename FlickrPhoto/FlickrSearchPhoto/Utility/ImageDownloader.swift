//
//  ImageDownloader.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class ImageDownloader {
    internal static let shared  = ImageDownloader()
    internal let operationQueue = OperationQueue()
    internal var requestInProcessHasMap : [String: Any] = [:]
    private init() {
        self.setOperationQueue()
    }
    
    private func setOperationQueue()  {
        self.operationQueue.maxConcurrentOperationCount = 10
        self.operationQueue.qualityOfService = .background
    }
    
    internal func downloadImage(url: URL, indexPath:IndexPath, completion:@escaping((_ image:UIImage?, _ error: Error?, _ imageUrl:String, _ indPath:IndexPath)->Void)) {
        let hashKey = NSString(string: url.absoluteString)
        if let cachedData = URLCacheManager.shared.getDataForKey(key:hashKey) as? UIImage {
            completion(cachedData, nil, url.absoluteString, indexPath)
        }
        
        if let op = requestInProcessHasMap[url.absoluteString] as? Operation {
            op.qualityOfService = .userInitiated
        } else {
            let operation = BlockOperation {
                let request = URLRequest(url: url)
                URLSession.shared.dataTask(with: request) { [weak self](data, response, error) in
                    if let imageData = data, error == nil, let image = UIImage(data: imageData)  {
                        completion(image, nil, url.absoluteString,indexPath)
                        URLCacheManager.shared.addDataToCache(data: image, key: hashKey)
                    } else {
                        completion(nil, error, url.absoluteString,indexPath)
                    }
                    self?.requestInProcessHasMap.removeValue(forKey: url.absoluteString)
                }.resume()
            }
            operation.qualityOfService = .background
            self.requestInProcessHasMap[url.absoluteString] = operation
            self.operationQueue.addOperation(operation)
        }
    }
    
}
