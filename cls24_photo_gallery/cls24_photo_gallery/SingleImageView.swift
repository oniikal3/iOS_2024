//
//  SingleImageView.swift
//  cls24_photo_gallery
//
//  Created by Nathapong Masathien on 15/3/24.
//

import SwiftUI
import PhotosUI

struct SingleImageView: View {
    
    @State private var selectedImageItem: PhotosPickerItem?
//    @State private var selectedImage: Image? // Seem to have bug when in loadTransferable(type:)
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            
//            selectedImage?
//                .resizable()
//                .scaledToFit()
            
            if (selectedImage != nil) {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .scaledToFit()
            }
            
            Spacer()
            
            PhotosPicker(selection: $selectedImageItem,
                         matching: .images,
                         preferredItemEncoding: .current,
                         photoLibrary: .shared()
            ) {
                Text("Edit Profile")
            }
        }
        .onChange(of: selectedImageItem) {
            Task {
                // This will produce a bug when select HEIF image
//                selectedImage = try await selectedImageItem?.loadTransferable(type: Image.self)
                guard let data = try await selectedImageItem?.loadTransferable(type: Data.self) else { return }
                selectedImage = UIImage(data: data)
            }
        }
    }
}

#Preview {
    SingleImageView()
}
