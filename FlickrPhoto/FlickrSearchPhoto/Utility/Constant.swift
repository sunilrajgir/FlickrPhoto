//
//  Constant.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import Foundation

internal struct Constant {
    //list
    internal static let flickrURl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&api_key=49b2afaa0f8ef1d1ec558b337ca989ff&text=\(Constant.text)&page=\(Constant.page)&nojsoncallback=1"
    internal static let text = "<text>"
    internal static let page = "<page>"
    //download
    internal static let imageUrl = "https://farm\(Constant.farm).staticflickr.com/\(Constant.server)/\(Constant.id)_\(Constant.secret).jpg"
    internal static let farm = "<farm>"
    internal static let server = "<server>"
    internal static let id = "<id>"
    internal static let secret = "<secret>"
}
