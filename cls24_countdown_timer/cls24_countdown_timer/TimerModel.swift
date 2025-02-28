//
//  TimerModel.swift
//  cls24_countdown_timer
//
//  Created by Nathapong Masathien on 30/1/2567 BE.
//

import Foundation
import Combine

//https://developer.apple.com/documentation/combine/replacing-foundation-timers-with-timer-publishers

enum TimerState {
    case active
    case paused
    case resumed
    case cancelled
}

@Observable final class TimerModel {
//    private(set) var duration: Int
    
//     private var timer = Timer.publish(every: 1, on: .main, in: .common)
    private var subscription: AnyCancellable?
    private var totalTimeSelection: Int {
        (selectedHoursAmount * 3600) + (selectedMinsAmount * 60) + selectedSecsAmount
    }
    
    var progress: Float = 0.0
    var completionDate = Date.now
    private(set) var timeRemaining: Int = 0

    
    var selectedHoursAmount = 0
    var selectedMinsAmount = 0
    var selectedSecsAmount = 0
    
    let hoursRange = 0...23
    let minuteRange = 0...59
    let secondsRange = 0...59
    
    private(set) var state: TimerState = .cancelled // try to use didSet after worked with function
    
//    init(mins: Int, secs: Int) {
//        let initTime = (mins*60) + secs
//        duration = initTime
//        timeRemaining = initTime
        //        stop()
//        timer.autoconnect()
//        timer.sink { value in
//            print(value)
//        }
//        subscription = Timer.publish(every: 1, on: .main, in: .common)
//            .autoconnect()
//            .sink(receiveValue: { output in
//                if self.timeRemaining > 0 {
//                    self.timeRemaining -= 1
//                } else {
//                    
//                }
//            })
//    }
    
//    var timeRemainingFormatted: String {
//        let mins = timeRemaining / 60
//        let secs = timeRemaining % 60
//        return String(format: "%02d:%02d", mins, secs)
//    }
    
    private func fireTimer() {
        subscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    self.progress = Float(self.timeRemaining) / Float(self.totalTimeSelection)
                } else {
//                    self.stop()
                    self.setState(.cancelled)
                }
            }
    }
    
//    func start() {
//        timeRemaining = totalTimeSelection
////        timer = Timer.publish(every: 1, on: .main, in: .common)
////        _ = timer.autoconnect()
////        subscription
//        fireTimer()
//        progress = 1.0
//        
//    }
//    
//    func stop() {
////        timer.connect().cancel()
//        subscription?.cancel()
//    }
//    
//    func resume() {
////        _ = timer.connect()
//        fireTimer()
//    }
//    
//    func reset() {
//        timeRemaining = totalTimeSelection
////        timer.connect().cancel()
//    }
    
    func setState(_ state: TimerState) {
        self.state = state
        switch state {
        case .cancelled:
            subscription?.cancel()
            timeRemaining = 0
            progress = 0
        case .active:
            timeRemaining = totalTimeSelection
            progress = 1.0
            fireTimer()
        case .paused:
            subscription?.cancel()
        case .resumed:
            fireTimer()
        }
    }
}

extension Int {
    var timeFormatted: String {
        let hour = self / 3600
        let minute = self / 60 % 60
        let second = self % 60

        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
}
