//
//  ErrorView.swift
//  NewsFeed
//
//  Created by Tejas Kashid on 28/02/26.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String?
    let actionRetry: () -> ()
    
    var body: some View {
        VStack {
            Text(errorMessage ?? "")
                .font(.caption)
                .multilineTextAlignment(.center)
            
            Button("Retry", action: actionRetry)

        }
    }
}
