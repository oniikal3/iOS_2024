//
//  ContentView.swift
//  cls24_calculator
//
//  Created by Nathapong Masathien on 1/2/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    let model = CalculatorModel()
    
    var body: some View {
        VStack {
            // Preview number
            Text(model.previewText)
                .foregroundStyle(Color.white)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding()
                .font(.largeTitle)
                .background(Color.gray)
            
            // Buttons
            VStack {
                
                // Row 1
                HStack {
                    NumericButtonView(title: "AC", value: 0, handler: { _ in model.clearAll() })
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(image: "plus.forwardslash.minus", value: 0)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "%", value: 0)
                        .aspectRatio(1, contentMode: .fit)
                    OperatorButtonView(type: .divide, handler: model.operatorHandler)
                        .aspectRatio(1, contentMode: .fit)
                }
                
                // Row 2
                HStack {
                    NumericButtonView(title: "7", value: 7, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "8", value: 8, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "9", value: 9, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    OperatorButtonView(type: .multiply, handler: model.operatorHandler)
                        .aspectRatio(1, contentMode: .fit)
                }
                
                // Row 3
                HStack {
                    NumericButtonView(title: "4", value: 4, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "5", value: 5, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "6", value: 6, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    OperatorButtonView(type: .subtract, handler: model.operatorHandler)
                        .aspectRatio(1, contentMode: .fit)
                }
                
                // Row 4
                HStack {
                    NumericButtonView(title: "1", value: 1, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "2", value: 2, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    NumericButtonView(title: "3", value: 3, handler: operandHandler)
                        .aspectRatio(1, contentMode: .fit)
                    OperatorButtonView(type: .add, handler: model.operatorHandler)
                        .aspectRatio(1, contentMode: .fit)
                }
                
                // Row 5
                HStack {
                    HStack {
                        NumericButtonView(title: "0", value: 0, handler: operandHandler)
                            .aspectRatio(2, contentMode: .fit)
                    }
                    HStack {
                        NumericButtonView(title: ".", handler: operandHandler)
                            .aspectRatio(1, contentMode: .fit)
                        OperatorButtonView(type: .equal, handler: model.operatorHandler)
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
            }
        }
        .padding()
        .background(Color.red)
    }
    
    private func operandHandler(newValue: Int?) -> Void {
        if let newValue = newValue {
            model.operandHandler(newInput: String(newValue))
        } else {
            // case type "."
            model.operandHandler(newInput: String("."))
        }
    }
}

#Preview {
    ContentView()
}
