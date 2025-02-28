//
//  GridView.swift
//  cls24_list_and_grid
//
//  Created by Nathapong Masathien on 2/2/2567 BE.
//

import SwiftUI

struct GridView: View {
    
//    @State private var url = URL(string: "https://picsum.photos/250/400")
    @State private var urls: [String] = []
    
    init() {
        var list = [String]()
        for _ in 1...30 {
            let random = Int.random(in: 100..<999)
            let urlString = "https://picsum.photos/id/\(random)/250/400"
//            self.urls.append(urlString)
            list.append(urlString)
        }
        _urls = State(wrappedValue: list)
    }
    
    var body: some View {
        //https://www.appcoda.com/navigationstack/
        NavigationStack {
            ScrollView(.vertical) {
                VGridView(urls: $urls)
//                HGridView(urls: $urls)
            }
            .navigationTitle("Gallery")
            .refreshable {
                urls.removeAll()
                
                for _ in 1...30 {
                    let random = Int.random(in: 100..<999)
                    let urlString = "https://picsum.photos/id/\(random)/250/400"
                    urls.append(urlString)
//                    url = URL(string: "https://picsum.photos/250/400")
                }
            }
        }

    }
}

#Preview {
    GridView()
}
