//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//

import SwiftUI
import SwiftData

@main
struct NewsFeedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: FavouriteNews.self)
        }
    }
}
