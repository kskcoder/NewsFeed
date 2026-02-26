//
//  NewsViewModel.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 24/02/26.
//
import Foundation
import Combine
import SwiftUI
import SwiftData

@MainActor
final class NewsViewModel: ObservableObject {
    
    enum ViewState {
        case idle
        case loading
        case loaded([News])
        case error(String)
    }
    
    @Published var state: ViewState = .idle
    @Published var searchText: String = ""
    
    private var allNews: [News] = []
    private var cancellables = Set<AnyCancellable>()
    private let service = NewsService()
    
    init() {
        setupSearchText()
    }
    
    func fetchNews() async {
        self.state = .loading
        
        do {
            let news = try await service.fetchNews()
            allNews = news.prefix(20).map{$0}
            withAnimation {
                state = .loaded(allNews)
            }
        } catch {
            self.state = .error("Failed to load news")
        }
    }
    
    func setupSearchText() {
        $searchText
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink{[weak self] text in
                self?.filterNews(withText: text)
            }
            .store(in: &cancellables)
    }
    
    func filterNews(withText query: String) {
        guard !query.isEmpty else {
            state = .loaded(allNews)
            return
        }
        
        state = .loaded(allNews.filter{
            $0.title.localizedCaseInsensitiveContains(query)
        })
    }
    
    func toggleFavourite(for id: Int, favourites: [FavouriteNews], context: ModelContext) {
        let stringId = String(id)
        if let existing = favourites.first(where: { $0.id == stringId }) {
            context.delete(existing)
        } else {
            context.insert(FavouriteNews(id: stringId))
        }
    }
}
