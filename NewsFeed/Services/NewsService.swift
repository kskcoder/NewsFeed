//
//  NewsService.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 24/02/26.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchNews() async throws -> [News]
}

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case decodingError
}

final class NewsService: NewsServiceProtocol {
    
    func fetchNews() async throws -> [News] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoded = try JSONDecoder().decode([News].self, from: data)
            return decoded
        } catch {
            throw NetworkError.decodingError
        }
    }
    
}
