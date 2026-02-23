//
//  NewsRow.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//

import SwiftUI

struct NewsRow: View {
    @Binding var news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
//            Toggle("Dark Mode ", isOn: $news.isFavourite) // Just and example to use Toggle
            
            Text(news.title)
                .font(.headline)
            
            Text(news.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            HStack {
                Text(news.author)
                    .font(.caption)
                
                Spacer()
                
                Button {
                    news.isFavourite.toggle()
                } label : {
                    Image(systemName: news.isFavourite ? "heart.fill" : "heart")
                    .foregroundColor(news.isFavourite ? .red : .gray)
                }
            }
            .foregroundColor(.secondary)
        }
        .padding()
    }
}
