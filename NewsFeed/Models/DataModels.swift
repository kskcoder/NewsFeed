//
//  DataModels.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 26/02/26.
//

import SwiftData

@Model
class FavouriteNews {
    @Attribute(.unique) var id: String
    
    init(id: String) {
        self.id = id
    }
}
