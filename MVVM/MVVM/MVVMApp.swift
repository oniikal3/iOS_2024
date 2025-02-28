//
//  MVVMApp.swift
//  MVVM
//
//  Created by Nathapong Masathien on 18/1/2567 BE.
//

import SwiftUI

@main
struct MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ProductListViewModel())
        }
    }
}
