//
//  FlickrModel.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

struct FlickrModel: Codable {
    let photos : FlickrPagedImageResult?
    let stat: String
}
