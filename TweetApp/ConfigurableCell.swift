//
//  ConfigurableCell.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype Model
    
    func configureWithModel(model: Model)
}

extension UIImageView {
    func downloadImageFromURLString(urlString: String?) {
        guard let urlString = urlString,
            let url = NSURL(string: urlString) else {
                return
        }
        
        let cache = SharedImageCache.sharedInstance
        if let cachedImage = cache.loadImage(urlString) {
            self.image = cachedImage
        } else {
            NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
                guard let data = data where error == nil else { return }
                dispatch_async(dispatch_get_main_queue()){
                    if let downloadedImage = UIImage(data: data) {
                        cache.cacheImage(downloadedImage, url: (response?.URL?.absoluteString)!)
                        self.image = downloadedImage
                    }
                }
                }.resume()
        }
    }
}