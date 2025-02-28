//
//  MultipleSelectionView.swift
//  cls24_photo_gallery
//
//  Created by Nathapong Masathien on 15/3/24.
//

import SwiftUI
import PhotosUI

@Observable
class ImagePickerViewModel {
    
    var selectedImageItems: [PhotosPickerItem] = [] {
        didSet {
            Task {
                var newImages = [Data]()
                
                for item in selectedImageItems {
                    if let data = try await item.loadTransferable(type: Data.self) {
                        newImages.append(data)
                    }
                }
                
                selectedImages = newImages
            }
        }
    }
    
    private(set) var selectedImages: [Data] = []
}

struct MultipleSelectionView: View {

    @State private var viewModel = ImagePickerViewModel()

    var body: some View {
        VStack {
            ImageList(viewModel: viewModel)
            
            PhotosPicker(selection: $viewModel.selectedImageItems,
                         selectionBehavior: .continuous,
                         matching: .images,
                         preferredItemEncoding: .current, // Use current to avoid transcoding.
                         photoLibrary: .shared()
            ) {
                Text("Select Photos")
            }
            .photosPickerStyle(.inline)
            .ignoresSafeArea()
            .photosPickerDisabledCapabilities(.selectionActions) // Disable cancel, add button in selection behavior
            .photosPickerAccessoryVisibility(.hidden, edges: .all) // Hide accessory views
            .frame(height: 250) // Can handle view height as others view
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct ImageList: View {
    
    var viewModel: ImagePickerViewModel
    
    private let rows = [
        GridItem(.adaptive(minimum: 250, maximum: .infinity))
    ]
    
    var body: some View {
        if viewModel.selectedImages.isEmpty {
            Spacer()
            Image(systemName: "text.below.photo")
                .font(.system(size: 150))
                .opacity(0.2)
            Spacer()
        } else {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, content: {
                    ForEach(viewModel.selectedImages, id: \.self) { imgData in
//                        ImageCardView(image: image)
                        ImageCardView(data: imgData)
                    }
                })
            }
            .background(.red)
        }
    }
}

struct ImageCardView: View {
    
//    var item: PhotosPickerItem
//    
//    @State private var image: Image?
//    var image: Image
    var data: Data
    
    var body: some View {
        if let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.green)

        } else {
            Circle().fill(.blue)
        }
//        image
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(height: 100)
//            .task {
//                do {
//                } catch {
//                    
//                }
//            }
    }
}

#Preview {
    MultipleSelectionView()
}
