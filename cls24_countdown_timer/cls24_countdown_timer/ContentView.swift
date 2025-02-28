//
//  ContentView.swift
//  cls24_countdown_timer
//
//  Created by Nathapong Masathien on 28/1/2567 BE.
//

import SwiftUI

// ทำปุ่ม stop และทำตัวอย่างการบ้านให้ นศ ดูว่า จะทำกำหนดตัวเลขลงไป หรือเพิ่มปุ่ม เพื่อเพิ่มเวลา ทำยังไง
// อาจจะให้ นศ ทำเพิ่มเวลา +1 , +5, +15 สามเวลา

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70, height: 70)
            .foregroundStyle(Color("StartButton"))
            .background(Color("StartButton").opacity(0.3))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding(.all, 3)
            .overlay {
                Circle()
                    .stroke(Color("StartButton").opacity(0.3), lineWidth: 2)
            }
    }
}

struct TimerView: View {
    @State private var model = TimerModel()
    
    var body: some View {
        VStack {
            if model.state == .cancelled {
                HStack {
                    TimePickerView(title: "hours",
                                   range: model.hoursRange,
                                   binding: $model.selectedHoursAmount)
                    TimePickerView(title: "min",
                                   range: model.minuteRange,
                                   binding: $model.selectedMinsAmount)
                    TimePickerView(title: "sec",
                                   range: model.secondsRange,
                                   binding: $model.selectedSecsAmount)
                }
                .padding()
                .background(.black)
                .foregroundStyle(.white)

            } else {
                ZStack {
//                    withAnimation {
                        CircularProgressView(progress: $model.progress)
//                    }
                    
                    VStack {
                        Text(model.timeRemaining.timeFormatted)
                            .font(.largeTitle)
                    }
                }
                .frame(width: 360, height: 255)
                .padding()
            }
            
            HStack {
                Button("Cancel") {
                    model.setState(.cancelled)
                }
                .buttonStyle(StartButtonStyle())
                
                Spacer()
                
                switch model.state {
                case .active, .resumed:
                    Button("Pause") {
                        model.setState(.paused)
                    }
                    .buttonStyle(StartButtonStyle())

                case .paused:
                    Button("Resume") {
                        model.setState(.resumed)
                    }
                    .buttonStyle(StartButtonStyle())

                case .cancelled:
                    Button("Start") {
                        model.setState(.active)
                    }
                    .buttonStyle(StartButtonStyle())
                }
            }
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .foregroundStyle(.white)
        
    }
}

//struct ContentView2: View {
//    
//    let timer = TimerModel()
//    
//    var body: some View {
//        VStack {
//            Text("Countdown Timer")
//                .font(.title)
//                .padding()
//            
//            Text(timer.timeRemainingFormatted)
//                .font(.largeTitle)
//            
//            HStack {
//                Button {
//                    timer.start()
//                } label: {
//                    Text("Start")
//                        .frame(width: 100)
//                }
//                
//                Button {
//                    timer.stop()
//                } label: {
//                    Text("Stop")
//                        .frame(width: 100)
//                }
//
//                Button {
//                    timer.resume()
//                } label: {
//                    Text("Resume")
//                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                }
//
//            }
//        }
//    }
//}

#Preview {
//    ContentView2()
    TimerView()
}

#Preview("Test") {
//    ContentView2()
    TimerView()
}

// Old template
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
