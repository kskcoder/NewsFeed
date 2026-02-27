//
//  RowView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 28/02/26.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var viewModel: NewsViewModel
    var newsList: [News] = []
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Color.clear
                    .frame(height: 0)
                    .id("TOP")
                
                LazyVStack(spacing: 10) {
                    ForEach (newsList) {news in
                        NavigationLink (value: news) {
                            NewsRow(news: news,
                                    viewModel: viewModel)
                        }
                    }
                }
                
                Button("Scroll To Top") {
                    proxy.scrollTo("TOP", anchor: .top)
                }
                .buttonStyle(.plain)
                
            }
        }
        .navigationDestination(for: News.self) {newsItem in
            NewsDetailView(news: newsItem)
        }
    }
}
