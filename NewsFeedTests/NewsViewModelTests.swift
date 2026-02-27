//
//  NewsViewModelTests.swift
//  NewsFeedTests
//
//  Created by Tejas Kashid on 28/02/26.
//

import XCTest

@testable import NewsFeed

final class NewsViewModelTests: XCTestCase {
    
    @MainActor
    func test_fetchNews_success() async {
        // Arrange
        let mockNewsService = MockNewsService()
        let expectedNews = [News(userId: 1, id: 1, title: "Mock Title", body: "Mock Body")]
        
        mockNewsService.result = .success(expectedNews)
        
        let viewModel = NewsViewModel(service: mockNewsService)
        
        // Act
        await viewModel.fetchNews()
        
        // Assert
        guard case .loaded(let news) = viewModel.state else {
            XCTFail("Expected Loaded State")
            return
        }
        
        XCTAssertEqual(news.first?.title, "Mock Title")
        XCTAssertEqual(news.count, 1)
    }
    
    @MainActor
    func test_fetchNews_failure() async {
        // Arrange
        let mockService = MockNewsService()
        mockService.result = .failure(URLError(.badServerResponse))
        
        let viewModel = NewsViewModel(service: mockService)
        
        // Act
        await viewModel.fetchNews()
        
        // Assert
        guard case .error = viewModel.state else {
            XCTFail("Expected error state")
            return
        }
    }

}
