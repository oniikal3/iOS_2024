//
//  VGridView.swift
//  cls24_list_and_grid
//
//  Created by Nathapong Masathien on 2/2/2567 BE.
//

import SwiftUI

struct VGridView: View {
    
    @Binding var urls: [String]
    
    private let columns = [
//        GridItem(.adaptive(minimum: 150, maximum: .infinity))
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.fixed(250))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns,
                  spacing: 10,
                  content: {
            ForEach (urls, id: \.self) { urlString in
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .transition(.opacity)
                } placeholder: {
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                }
            }
        })
        .padding()
    }
}

#Preview {
    VGridView(urls: .constant([]))
}
