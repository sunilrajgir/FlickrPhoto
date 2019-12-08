//
//  PhotoCollectionCell.swift
//  FlickrPhoto
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    
    var indexPath : IndexPath?
    var requestUrl : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.indexPath = nil
        self.requestUrl = nil
    }
    
    func fetchImage(imageModel: FlickrImageModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        if let url = self.getDownloadUrl(imageModel: imageModel) {
            self.requestUrl = url.absoluteString
            ImageDownloader.shared.downloadImage(url:url, indexPath: indexPath) {[weak self] (image, error, imageUrl,indPath) in
                if error == nil && (((self?.requestUrl?.lowercased() ?? "") == imageUrl.lowercased()) && ((self?.indexPath?.row ?? 0) == indexPath.row)) {
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            }
        }
    }
    
    func downgradePriorityOfImageFetch(imageModel: FlickrImageModel, indexPath: IndexPath) {
        if let url = self.getDownloadUrl(imageModel: imageModel) {
            ImageDownloader.shared.downgradePriorityOfDownloadImage(url:url, indexPath: indexPath)
        }
    }
    
    private func getDownloadUrl(imageModel: FlickrImageModel)-> URL? {
        var imageUrl = URLManager.getImageUrl()
        imageUrl = imageUrl.replacingOccurrences(of: Constant.farm, with: "\(imageModel.farm)")
        imageUrl = imageUrl.replacingOccurrences(of: Constant.server, with: imageModel.server)
        imageUrl = imageUrl.replacingOccurrences(of: Constant.id, with: imageModel.id)
        imageUrl = imageUrl.replacingOccurrences(of: Constant.secret, with: imageModel.secret)
        return URL(string: imageUrl)
    }

}
