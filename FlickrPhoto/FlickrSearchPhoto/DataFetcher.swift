//
//  PhotoDataGateway.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class DataFetcher {
    func loadUrlContent(url : URL, completionBlock:@escaping ((_ data:Data?, _ error:Error?)->Void)) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil {
                completionBlock(data,nil)
            } else {
                completionBlock(nil,nil)
            }
        }.resume()
    }
}
