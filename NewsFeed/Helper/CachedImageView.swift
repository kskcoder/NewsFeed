//
//  CacheImageView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 27/02/26.
//
import SwiftUI

struct CachedImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.load(from: url)
        }
    }
}
