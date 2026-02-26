//
//  NewsRow.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 23/02/26.
//

import SwiftUI
import SwiftData

struct NewsRow: View {
    let news: News
    @State private var isExpanded: Bool = false
    @ObservedObject var viewModel: NewsViewModel
    @Query private var favourites: [FavouriteNews]
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(news.title)
                    .modifier(CardTitle())                    

                Spacer()

                let isLiked = favourites.contains { $0.id == String(news.id) }
                
                Button {
                    viewModel.toggleFavourite(for: news.id, favourites: favourites, context: context)
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                        .scaleEffect(isLiked ? 1.3 : 1.0)
                        .animation(.spring(), value: isLiked)
                }
                .buttonStyle(.plain)
            }

            if isExpanded {
                Text(news.body)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .trailing)
                        )
                    )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 12)
        //        .animation(.spring, value: isExpanded)
//        .onTapGesture {
//            withAnimation(.spring(response: 1, dampingFraction: 0.8)) {
//                isExpanded.toggle()
//            }
//        }
    }
}
