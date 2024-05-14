//
//  ImageCache.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

final class ImageCache {
    private static var cache = NSCache<NSString, AnyObject>()
    
    static func store(key: String, data: AnyObject) {
        cache.setObject(data, forKey: NSString(string: key))
    }
    
    static func load(key: String) -> AnyObject? {
        return cache.object(forKey: NSString(string: key))
    }
}
