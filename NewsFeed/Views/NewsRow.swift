//
//  NewsRow.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//

import SwiftUI

struct NewsRow: View {
    let news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
//            Toggle("Dark Mode ", isOn: $news.isFavourite) // Just and example to use Toggle
            
            Text(news.title)
                .font(.headline)
            
            Text(news.body)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .padding()
    }
}
