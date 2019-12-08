//
//  View.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class View: UIView {
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate let spaceBetweenCells = 10.0
    fileprivate let safeAreaSpace = 20.0
    fileprivate let loaderCellHeight = 50.0
    fileprivate let noOfCollectionCellInEachRow = 3 // can be set int value
    fileprivate let screenWidth = UIScreen.main.bounds.size.width
    fileprivate var photoCellWidth : CGFloat = 0.0
 

    internal var controller : Controller!
    internal var viewModel : ViewModel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func bind(controller : Controller) {
        self.controller = controller
        self.viewModel = self.controller.getViewModel()
        self.viewModel.delegate = self
        self.setUpCollectionView()
        self.viewModel.initialSetup { () -> (Void) in
            self.setUp()
        }
    }
    
    fileprivate func setUpCollectionView() {
        self.collectionView.register(UINib(nibName: "PhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionCell")
        self.collectionView.register(UINib(nibName: "LoaderCollectionCell", bundle: nil), forCellWithReuseIdentifier: "LoaderCollectionCell")
        self.calculateCellWidth()
    }
    
    fileprivate func  calculateCellWidth() {
        let leftRightPadding = 2*safeAreaSpace
        let totalPaddingBetweenCell = (Double(noOfCollectionCellInEachRow)-1)*spaceBetweenCells
        self.photoCellWidth = (screenWidth-CGFloat(leftRightPadding)-CGFloat(totalPaddingBetweenCell))/CGFloat(noOfCollectionCellInEachRow)
    }
    
    internal func loadNextPageData() {
        self.controller?.nextPageAction()
    }
        
    private func setUp() {
        self.collectionView.isHidden = self.viewModel.getIsCollectionViewHidden()
    }
    
}

// MARK: ViewModelProtocol
extension View : ViewModelProtocol {
    func showData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension View: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == (self.viewModel.numberOfItemsInSection(section: indexPath.section)-1){
            return self.collectionView.dequeueReusableCell(withReuseIdentifier: "LoaderCollectionCell", for: indexPath)
        } else {
            return self.collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == (self.viewModel.numberOfItemsInSection(section: indexPath.section)-1) {
             let width = screenWidth-CGFloat(2*safeAreaSpace)
             return CGSize(width: width, height: CGFloat(loaderCellHeight))
        } else {
            return CGSize(width: self.photoCellWidth, height: self.photoCellWidth)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenCells)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenCells)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let collectionCell = cell as? PhotoCollectionCell, indexPath.row < self.viewModel.numberOfItemsInSection(section: indexPath.section) {
            if let imageModel = self.viewModel.getImageModel(row: indexPath.row) {
                collectionCell.fetchImage(imageModel: imageModel, indexPath: indexPath)
            }
        } else if cell.isKind(of: LoaderCollectionCell.self) {
            self.loadNextPageData()
        }
    }
}
