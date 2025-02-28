//
//  ContentView.swift
//  cls24_firstapp
//
//  Created by Nathapong Masathien on 27/1/2567 BE.
//

import SwiftUI

enum Emoji: String, CaseIterable {
    case 🍎, 🍊, 🍉, 🍓
}

struct ContentView: View {
    @State var selection: Emoji = .🍉
    
    var body: some View {
        NavigationView {
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                
                Picker("Select Emoji", selection: $selection) {
                    // Inside of view builder must use ForEach not for-in
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Fruits Lover")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
