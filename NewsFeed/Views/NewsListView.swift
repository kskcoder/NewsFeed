//
//  NewsListView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//

import SwiftUI

@MainActor
struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel(service: NewsService())
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle("NewsFeed")
                .searchable (text: $viewModel.searchText)
                .task {
                    await viewModel.fetchNews()
                }
                .refreshable {
                    await viewModel.fetchNews()
                }
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    if (oldPhase == .inactive && newPhase == .active) {
                        Task {
//                            await viewModel.fetchNews() //works fine commented to avoid unnecessary api calls
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            EmptyView()
        
        case .loading:
            LoadingView()
            
        case .loaded(let newsList):
            RowView(viewModel: viewModel,
                    newsList: newsList)
            
        case .error(let errorMessage):
            ErrorView(errorMessage: errorMessage) {
                Task {
                    await viewModel.fetchNews()
                }
            }
        }
    }
}
