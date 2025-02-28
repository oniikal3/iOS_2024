//
//  OperatorButtonView.swift
//  cls24_calculator
//
//  Created by Nathapong Masathien on 2/2/2567 BE.
//

import SwiftUI

enum OperatorType {
    case multiply
    case divide
    case add
    case subtract
    case equal
}

extension OperatorType {
    var image: String {
        switch self {
        case .add:
            return "plus"
        case .divide:
            return "divide"
        case .multiply:
            return "multiply"
        case .subtract:
            return "minus"
        case .equal:
            return "equal"
        }
    }
}

typealias OperatorKeyHandler = (OperatorType) -> Void

struct OperatorButtonView: View {
    
//    var title: String?
//    var image: String?
    var type: OperatorType
    var handler: OperatorKeyHandler?
    
    var body: some View {
        Button(action: {
            handler?(type)
        }, label: {
            Image(systemName: type.image)
//            if let imageName = image {
//                Image(systemName: imageName)
//            }
//            
//            if let title = title {
//                Text(title)
//            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("OperatorKeyColor"))
        .foregroundColor(.white)
        .font(.headline)
        .fontWeight(.bold)
    }
}

#Preview {
    OperatorButtonView(type: .add)
}
