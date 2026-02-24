//
//  NewsListView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle("NewsFeed")
                .navigationDestination(for: News.self) { news in
                    NewsDetailView(news: news)
                }
                .searchable (text: $viewModel.searchText)
                .task {
                    await viewModel.fetchNews()
                }
                .refreshable {
                    await viewModel.fetchNews()
                }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            EmptyView()
        
        case .loading:
            ProgressView()
            
        case .loaded(let newsList):
            List (newsList) { newsItem in
                NavigationLink(value: newsItem) {
                    NewsRow(news: newsItem)
                }
            }
            .navigationDestination(for: News.self) { news in
                NewsDetailView(news: news)
            }
            
        case .error(let errorMessage):
            VStack {
                Text(errorMessage)
                    .multilineTextAlignment(.center)
                
                Button("Retry") {
                    Task {
                        await viewModel.fetchNews()
                    }
                }
            }
        }
    }
}
