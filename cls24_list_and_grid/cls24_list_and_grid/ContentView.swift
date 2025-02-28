//
//  ContentView.swift
//  cls24_list_and_grid
//
//  Created by Nathapong Masathien on 2/2/2567 BE.
//

import SwiftUI

struct Menu: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

struct ContentView: View {
    
    let items = ["Item 1", "Item 2", "Item 3"]
    
    let menues = [
        Menu(title: "Share", image: "square.and.arrow.up"),
        Menu(title: "Edit", image: "pencil"),
        Menu(title: "Remove", image: "eraser.fill")
    ]
    
    @State private var isExpanded = false
    @State private var test = ""
    @State private var isOnAirplaneMode = false
    
//    init() {
//            UITableView.appearance().backgroundColor = .clear // For tableView
//            UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
//        }

    var body: some View {
//        List(items, id: \.self) { item in
//            Text(item)
//        }
//        
//        List {
//            ForEach(items, id: \.self) { item in
//                Text(item)
//            }
//        }
        
        List {
            Section {
                ForEach(Array(items.enumerated()), id: \.element) { index, item in
                    Text("Index: \(index), Title: \(item)")
                }
                .onDelete(perform: { indexSet in
                    print(indexSet)
                })
            } header: {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec.")
            } footer: {
                Text("Lorem ipsum dolor sit amet.")
            }
            
            // Only work with sidebar style
            Section(isExpanded: $isExpanded) {
                ForEach(Array(items.enumerated()), id: \.element) { index, item in
                    Text("Index: \(index), Title: \(item)")
                }
                .onDelete(perform: { indexSet in
                    print(indexSet)
                })
            } header: {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec.")
            }
            
            // Menu
            Section {
                ForEach(menues) { menu in
                    Label(menu.title, systemImage: menu.image)
                        .badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .listRowBackground(Color.clear)

                }
            } header: {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec.")

            } footer: {
                Text("Lorem ipsum dolor sit amet.")
            }
            
            
            // Toggle
            Section {
                Toggle("Airplane Mode", systemImage: "airplane", isOn: $isOnAirplaneMode)
                    .foregroundStyle(.orange)
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(.yellow)
                    .listRowBackground(AsyncImage(url: URL(string: "https://picsum.photos/500/40")))
                HStack {
                    Label(
                        title: {
                            Text("Cellular")
                        },
                        icon: { 
                            Image(systemName: "antenna.radiowaves.left.and.right")
                                .foregroundStyle(.green)
                        }
                    )
                    Spacer() // สร้าง space ระหว่่าง Label และ Text
                    Text(isOnAirplaneMode ? "Disabled" : "Enabled")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                }
            } header: {
                Text("Toggle")
            }

        }
        .listStyle(.plain) // Default is automatic = insetGrouped
        .background {
//            AsyncImage(url: URL(string: "https://picsum.photos/500/500"))
            Color.purple
        }
        
    }
}

#Preview {
    ContentView()
}
    
