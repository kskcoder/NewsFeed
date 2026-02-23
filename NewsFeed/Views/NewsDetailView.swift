//
//  NewsDetailView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 24/02/26.
//

import SwiftUI

struct NewsDetailView: View {
    let news: News
    @State var showSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text(news.title)
                    .font(.title)
                    .bold()
                
                Text("By: \(news.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(news.content)
                    .font(.body)
                
                Button("Read More") {
                    showSheet = true
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("News Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet (isPresented: $showSheet) {
            VStack {
                Text("Full article coming soon")
                    .font(.headline)
                Button("Close") {
                    showSheet = false
                }
                .padding()
            }
        }
    }
}
