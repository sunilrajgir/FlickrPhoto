//
//  Controller.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class Controller {
    private let interactor : Interactor
    private let presenter : Presenter
    
    private var currentPage = 1
    private var text : String = ""
    
    init(interactor : Interactor, presenter : Presenter) {
        self.interactor = interactor
        self.presenter = presenter
    }
    
    internal func getViewModel()  -> ViewModel {
        return self.presenter.viewModel;
    }
        
    internal func searchPhoto(text:String) {
        self.text = text
        if let url = self.getListUrl() {
            self.interactor.fetchData(url: url) {[weak self] (data, error) in
                self?.presenter.showFetchedData(photoModel: data)
            }
        }
    }
    
    internal func nextPageAction() {
        self.currentPage = currentPage+1;
        if let url = self.getListUrl() {
            self.interactor.fetchData(url: url) {[weak self] (data, error) in
                self?.presenter.showNextPageData(photoModel: data)
            }
        }
    }
    
   private func getListUrl()->URL? {
        var listUrl = URLManager.getListUrl()
        listUrl = listUrl.replacingOccurrences(of: Constant.text, with: self.text)
        listUrl = listUrl.replacingOccurrences(of: Constant.page, with: "\(self.currentPage)")
        return URL(string: listUrl)
    }
}
