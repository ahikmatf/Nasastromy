//
//  UIImageView+extensions.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

extension UIImageView {
    func load(from urlString: String) {
        let downloader = ImageDownloader()
        let finalUrlString = handleYoutubeLink(urlString: urlString)
        
        if let image = ImageCache.load(key: finalUrlString) as? UIImage {
            setImage(image)
            return
        }
        
        downloader.load(from: finalUrlString) { [weak self] image in
            ImageCache.store(key: finalUrlString, data: image)
            self?.setImage(image)
            return
        }
    }
    
    private func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
    
    private func handleYoutubeLink(urlString: String) -> String {
        if !urlString.contains("youtube") { return urlString }
        guard let url = URL(string: urlString) else { return urlString }
        return "https://img.youtube.com/vi/\(url.lastPathComponent)/0.jpg"
    }
}
