//
//  ImageLoader.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 27/02/26.
//
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func load(from url: URL) {
        if let cached = ImageCache.shared.object(forKey: url.absoluteString as NSString) {
            self.image = cached
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data, let uiImage = UIImage(data: data) else {return}
            
            ImageCache.shared.setObject(uiImage, forKey: url.absoluteString as NSString)
            
            DispatchQueue.main.async { [weak self] in
                self?.image = uiImage
            }
        }.resume()
    }
}
