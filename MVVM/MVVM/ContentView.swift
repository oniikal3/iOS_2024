//
//  ContentView.swift
//  MVVM
//
//  Created by Nathapong Masathien on 18/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: ProductListViewModel
    
    var body: some View {
        VStack {
            Picker("Categories", selection: $vm.selectedCategory) {
                ForEach(vm.categories, id: \.self) {
                    Text($0)
                }
            }
            List(vm.filteredProducts) { product in
                Text(product.name)
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    ContentView(vm: ProductListViewModel())
}
