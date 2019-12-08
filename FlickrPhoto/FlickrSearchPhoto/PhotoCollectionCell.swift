//
//  PhotoCell.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func fetchImage(imageModel: FlickrURLs) {
        if let url = self.getDownloadUrl(imageModel: imageModel) {
            ImageDownloader.shared.downloadImage(url:url) {[weak self] (image, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            }
        }
    }
    
    private func getDownloadUrl(imageModel: FlickrURLs)-> URL? {
        var imageUrl = URLManager.getImageUrl()
        imageUrl = imageUrl.replacingOccurrences(of: Constant.farm, with: "\(imageModel.farm)")
        imageUrl = imageUrl.replacingOccurrences(of: Constant.server, with: imageModel.server)
        imageUrl = imageUrl.replacingOccurrences(of: Constant.id, with: imageModel.id)
        imageUrl = imageUrl.replacingOccurrences(of: Constant.secret, with: imageModel.secret)
        return URL(string: imageUrl)
    }

}
