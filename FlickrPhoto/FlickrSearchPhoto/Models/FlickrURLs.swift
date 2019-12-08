//
//  FlickrURLs.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal struct FlickrURLs: Codable {
    internal let id : String
    internal let owner: String
    internal let secret: String
    internal let server: String
    internal let farm: Int
}
