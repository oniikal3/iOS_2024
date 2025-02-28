//
//  ContentView.swift
//  cls24_photo_gallery
//
//  Created by Nathapong Masathien on 15/3/24.
//

import SwiftUI

// Ref: https://developer.apple.com/videos/play/wwdc2023/10107/

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Single selection") {
                    SingleImageView()
                }
                
                NavigationLink("Multiple selection") {
                    MultipleSelectionView()
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
