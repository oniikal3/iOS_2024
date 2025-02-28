//
//  HGridView.swift
//  cls24_list_and_grid
//
//  Created by Nathapong Masathien on 2/2/2567 BE.
//

import SwiftUI

struct HGridView: View {
    
    @Binding var urls: [String]
    
    private let rows = [
        GridItem(.adaptive(minimum: 500, maximum: .infinity))
    ]
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: 10, content: {
            ForEach (urls, id: \.self) { urlString in
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
//                        .scaledToFit()
                        .transition(.opacity)
                } placeholder: {
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                }
            }
        })
    }
}

#Preview {
    HGridView(urls: .constant([]))
}
