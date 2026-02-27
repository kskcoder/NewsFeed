//
//  LoadingView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 28/02/26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
        Text("Content is loading")
            .font(.subheadline)
    }
}
