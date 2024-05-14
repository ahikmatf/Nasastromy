//
//  ImageCache.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

final class ImageCache {
    private static var cache = NSCache<NSString, AnyObject>()
    
    static func store(key: NSString, data: AnyObject) {
        cache.setObject(data, forKey: key)
    }
    
    static func load(key: NSString) -> AnyObject? {
        return cache.object(forKey: key)
    }
}
