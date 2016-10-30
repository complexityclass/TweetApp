//
//  SharedImageCache.swift
//  TweetApp
//
//  Created by Popov Valery on 31/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class SharedImageCache {
    
    static let sharedInstance = SharedImageCache()
    
    private let cache = NSCache()
    
    func cacheImage(image: UIImage, url: String) {
        cache.setObject(image, forKey: url)
    }
    
    func loadImage(url: String) -> UIImage? {
        return cache.objectForKey(url) as? UIImage
    }
}