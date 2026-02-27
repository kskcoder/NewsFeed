//
//  MockNewsService.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 28/02/26.
//

final class MockNewsService: NewsServiceProtocol {
    var result: Result<[News], Error> = .success([])
    
    func fetchNews() async throws -> [News] {
        return try result.get()
    }
}
