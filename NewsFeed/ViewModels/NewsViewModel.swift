//
//  NewsViewModel.swift
//  NewsFeed
//
//  Created by Darshana Kamble on 24/02/26.
//
import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var selectedNews: News?
    @Published var showAlert: Bool = false
    
    init() {
        loadMockNews()
    }
    
    private func loadMockNews() {
        news = [
            News(
                title: "Apple Launches AI Chip",
                description: "Apple introduced a new AI-optimized chip.",
                author: "TechCrunch",
                content: "Full article content goes here..."
            ),
            News(
                title: "SwiftUI 6 Released",
                description: "Major improvements in performance.",
                author: "Apple News",
                content: "Detailed SwiftUI 6 content..."
            )
        ]
    }
    
    
}
