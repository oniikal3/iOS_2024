//
//  ContentView.swift
//  cls24_photo_and_camera
//
//  Created by Nathapong Masathien on 14/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cameraManager = CameraManager()
    @State private var isPermittedShowCamera = false
    @State private var selectedImage: UIImage?
    @State private var isShowSettings = false
    
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Button(action: {
                if cameraManager.permissionGranted {
                    isPermittedShowCamera = true
                } else {
                    Task {
                        await cameraManager.requestPermission()
                        if cameraManager.permissionGranted == false {
                            print("Show alert to go to settings app")
                            isShowSettings = true
                        }
                    }
                }
            }, label: {
                Text("Camera")
            })
        }
        .padding()
        .onChange(of: cameraManager.permissionGranted) {
            isPermittedShowCamera = cameraManager.permissionGranted
        }
//        .onAppear {
//            Task {
//                await cameraManager.requestPermission()
//            }
//        }
        .fullScreenCover(isPresented: $isPermittedShowCamera, content: {
            CameraView(selectedImage: $selectedImage)
        })
        .alert("Title", isPresented: $isShowSettings) {
            Button("Go to Setting") {
                Task {
                    await UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }
            }
            Button("Cancel", role: .cancel, action: {})
        } message: {
            Text("Message")
        }


    }
}

#Preview {
    ContentView()
}
