//
//  UIImageView+extensions.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

extension UIImageView {
    func load(from urlString: String) {
        DispatchQueue.global(qos: .background).async {
            let checkedUrlString = self.handleYoutubeLink(urlString: urlString)
            guard let url = URL(string: checkedUrlString) else {
                return
            }

            guard let data = try? Data(contentsOf: url) else {
                return
            }

            guard let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    private func handleYoutubeLink(urlString: String) -> String {
        if !urlString.contains("youtube") { return urlString }
        guard let url = URL(string: urlString) else { return urlString }
        return "https://img.youtube.com/vi/\(url.lastPathComponent)/0.jpg"
    }
}


