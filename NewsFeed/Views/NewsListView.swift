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
            List ($viewModel.news) { $newsItem in
                NavigationLink(value: newsItem) {
                    NewsRow(news: $newsItem)
                }
            }
            .navigationTitle("NewsFeed")
            .navigationDestination(for: News.self) { news in
                NewsDetailView(news: news)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showAlert = true
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }
            .alert("Coming Soon",
                   isPresented: $viewModel.showAlert) {
                Button("OK", role: .close) {
//                    viewModel.showAlert = false
                }
            } message: {
                Text("Notification feature is under development")
            }
        }
            
    }
}
