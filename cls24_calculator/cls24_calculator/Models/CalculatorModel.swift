//
//  CalculatorModel.swift
//  cls24_calculator
//
//  Created by Nathapong Masathien on 2/2/2567 BE.
//

import Foundation

@Observable
class CalculatorModel {
    
//    private var currentResult: Double = 0.0
    
    var previewText: String = "0"
    
    private var inputs: [String] = []
    private var operand1: Double?
    private var operand2: Double?
    private var currentOperator: OperatorType?
    
    func operandHandler(newInput: String) {
        // ถ้าใน inputs มี "." แล้ว จะไม่ให้พิมพ์ . เพิ่มมาอีก
        guard !(newInput == "." && inputs.contains(".")) else {
            return
        }
        
//        if newInput == "." && inputs.contains(".") {
//            return
//        }
        inputs.append(newInput)
        previewText = inputs.reduce("", {$0 + $1})
    }
    
    func operatorHandler(newOperator: OperatorType) {
//        if inputs.isEmpty {
//            return
//        }
        
        let currentOperand = inputs.reduce("", {$0 + $1})
        
        if operand1 == nil {
            operand1 = Double(currentOperand)
        } else {
            operand2 = Double(currentOperand)
        }
        
        inputs.removeAll()
        
        
        if newOperator == .equal {
            equalHandler()
        } else {
            
            let result = performOperation(currentOperator ?? newOperator)
            previewText = String(result ?? 0)
            if let result {
                operand1 = result
            }
            
            currentOperator = newOperator
        }
    }
    
    private func equalHandler() {
        guard let oper = currentOperator else { return }
        let result = performOperation(oper)
        previewText = String(result ?? 0)
        operand1 = result
    }
    
    private func performOperation(_ currentOper: OperatorType) -> Double? {
        guard let op1 = operand1, let op2 = operand2 else {
            return nil
        }
        
        switch currentOper {
        case .add:
            return op1 + op2
        case .subtract:
            return op1 - op2
        case .multiply:
            return op1 * op2
        case .divide:
            if op2 != 0 {
                return op1 / op2
            } else {
                // Error เพราะไม่สามารถเอา 0 มาหารได้
                return nil
            }
        case .equal:
            return nil
        }
    }
    
    func clearAll() {
        inputs.removeAll()
        operand1 = nil
        operand2 = nil
        currentOperator = nil
        previewText = "0"
    }
    
    func getCurrentInputs() -> String {
        let current = inputs.reduce("", { (result, next) in
            result + next
        })
        
        // If there's no number in the list then show 0
        return current.count != 0 ? current : "0"
    }
    
}
