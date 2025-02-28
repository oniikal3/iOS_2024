//
//  NumericButtonView.swift
//  cls24_calculator
//
//  Created by Nathapong Masathien on 1/2/2567 BE.
//

import SwiftUI

typealias NumericKeyHandler = (Int?) -> Void

struct NumericButtonView: View {
    
    var title: String?
    var image: String?
    var value: Int?
    
    var handler: NumericKeyHandler?
    
    var body: some View {
        Button(action: {
            handler?(value)
        }, label: {
            if let imageName = image {
                Image(systemName: imageName)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            
            if let title = title {
                Text(title)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
        })
        .background(Color("NumericKeyColor"))
        .foregroundColor(.white)
        .font(.headline)
        .fontWeight(.bold)
    }
}

#Preview {
    NumericButtonView(title: "1", value: 1)
}

let primaryColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
let secondaryColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
