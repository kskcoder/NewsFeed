//
//  News.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//
import Foundation

struct News: Identifiable, Hashable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var imagePath: String {
        return "https://picsum.photos/id/\(id)/300/200"
    }
}
