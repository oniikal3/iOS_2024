//
//  Product.swift
//  MVVM
//
//  Created by Nathapong Masathien on 18/1/2567 BE.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}
