//
//  CameraManager.swift
//  cls24_photo_and_camera
//
//  Created by Nathapong Masathien on 14/3/24.
//

import Foundation
import AVFoundation

@Observable
class CameraManager {
    var permissionGranted = false
    
    func requestPermission() async {
        permissionGranted = await AVCaptureDevice.requestAccess(for: .video)
    }
}
