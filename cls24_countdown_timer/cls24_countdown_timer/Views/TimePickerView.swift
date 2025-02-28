//
//  TimePickerView.swift
//  cls24_countdown_timer
//
//  Created by Nathapong Masathien on 3/2/2567 BE.
//

import SwiftUI

struct TimePickerView: View {
    
    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>
    
    var body: some View {
        HStack(spacing: -4.0) {
            Picker(title, selection: binding) {
                ForEach(range, id: \.self) { time in
                    HStack {
                        Spacer()
                        Text("\(time)")
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .pickerStyle(.inline)
            .labelsHidden()

            Text(title)
                .fontWeight(.bold)
        }
        
    }
}

#Preview {
    TimePickerView(title: "secs", range: 0...59, binding: .constant(1))
}
