//
//  ContentView.swift
//  cls24_images
//
//  Created by Nathapong Masathien on 1/2/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    let staticURLString = "https://picsum.photos/id/237/1000/1000"
    
    var body: some View {
        VStack {
            
            // Get image from Assets
            Image("dog")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .background(.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay {
                    Circle().stroke(.green, lineWidth: 2)
                }
            
            // Get image from URL
//            AsyncImage(url: URL(string: "https://picsum.photos/200/300")!)
            
            AsyncImage(url: URL(string: "https://picsum.photos/1000/3000")) { image in
                image.resizable()
                    .scaledToFit()
                    .transition(.scale(scale: 1, anchor: .center))
            } placeholder: {
                ProgressView()
            }
            .padding()
            
            // In case to handle error loading
            AsyncImage(url: URL(string: staticURLString),
                       transaction: Transaction(animation: .bouncy(duration: 1))) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .transition(.scale(1, anchor: .center))
                case .failure(let error):
                    Text(error.localizedDescription)
                    Image(systemName: "wifi.slash")
                    
                default:
                    EmptyView()
                }
            }
//            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)


        }
    }
}

#Preview {
    ContentView()
}
