//
//  View+Ext.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 26/02/26.
//

import SwiftUI

struct CardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .background(Color.yellow)
            .multilineTextAlignment(.leading)
    }
}
