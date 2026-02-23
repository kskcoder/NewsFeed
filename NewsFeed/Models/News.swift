//
//  News.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//
import Foundation

struct News: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let author: String
    let content: String
    var isFavourite: Bool = false
}
