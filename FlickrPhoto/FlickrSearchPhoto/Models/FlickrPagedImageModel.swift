//
//  FlickrPagedImageModel.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal struct FlickrPagedImageModel: Codable {
    internal let photo : [FlickrImageModel]
    internal let page: Int
    internal let pages: Int
    internal let perpage: Int
    internal let total: String
}
