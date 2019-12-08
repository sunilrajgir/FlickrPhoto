//
//  Builder.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Builder {
    class func buildPhotoViewController() -> PhotoViewController {
        let uiViewController = PhotoViewController(nibName: "PhotoViewController", bundle: nil)
        let dataGateway = DataFetcher()
        let interactor = Interactor(dataGateway: dataGateway, flickerModel: FlickrModel.self)
        let photoViewModel = ViewModel()
        let presenter = Presenter(viewModel: photoViewModel)
        uiViewController.controller = Controller(interactor:interactor, presenter: presenter)
        return uiViewController
    }
}
