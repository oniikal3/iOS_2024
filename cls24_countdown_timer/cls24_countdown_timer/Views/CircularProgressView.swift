//
//  CircularProgressView.swift
//  cls24_countdown_timer
//
//  Created by Nathapong Masathien on 3/2/2567 BE.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            // Gray circle
            Circle()
                .stroke(lineWidth: 8.0)
                .opacity(0.3)
                .foregroundStyle(.gray)
            
            // Orange circle
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.orange)
                .rotationEffect(Angle(degrees: 270)) // เพื่อให้เริ่ม animation จาก 12 นาฬิกา ถ้าเป็น default จะเริ่มที่ 3 นาฬิกา
        }
        .animation(.linear(duration: 1.0), value: progress)
    }
}

#Preview {
    CircularProgressView(progress: .constant(0.1))
}
