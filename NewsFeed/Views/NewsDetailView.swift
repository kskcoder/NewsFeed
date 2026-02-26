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
            VStack (spacing: 10){
                AsyncImage(url: URL(string: news.imagePath)) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Color.gray.opacity(0.1)
                            ProgressView()
                        }
                    
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        ZStack {
                            Color.gray.opacity(0.1)
                            Image(systemName: "exclamationmark.triangle")
                        }
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 200)
                .clipped()
                
                CachedImageView(url: URL(string: news.imagePath)!)
                
                Text(news.title)
                    .font(.title)
                    .bold()
                
                Text(news.body)
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
