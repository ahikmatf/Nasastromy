//
//  ImageDownloader.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

final class ImageDownloader {
    let backgroundDispatchQueue: DispatchQueueType
    
    init(backgroundDispatchQueue: DispatchQueueType = DispatchQueue.global(qos: .background)) {
        self.backgroundDispatchQueue = backgroundDispatchQueue
    }
    
    func load(from urlString: String, completion: @escaping (UIImage) -> Void) {
        backgroundDispatchQueue.async {
            guard let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                return
            }
            
            completion(image)
        }
    }
}
