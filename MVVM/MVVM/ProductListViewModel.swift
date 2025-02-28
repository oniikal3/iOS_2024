//
//  ProductListViewModel.swift
//  MVVM
//
//  Created by Nathapong Masathien on 18/1/2567 BE.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published var categories: [String] = []
    @Published var selectedCategory: String = "Electronics"
    @Published var filteredProducts: [Product] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var products: [Product] = [
        Product(name: "iPhone 15", category: "Electronics"),
        Product(name: "AirPods Pro", category: "Electronics"),
        Product(name: "iPad Pro", category: "Electronics"),
        Product(name: "This is a book", category: "Books")
    ]
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        // Use Set to remove duplicates
        self.categories = Set(products.map {$0.category}).sorted()
        $selectedCategory
            .sink { [weak self] category in
                self?.filterProducts(by: category)
            }
            .store(in: &cancellables)
    }
    
    private func filterProducts(by category: String) {
        if category.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter { $0.category == category }
        }
    }
}

