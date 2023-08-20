//
//  SpeechPause.swift
//  Release
//
//  Created by mora hakim on 20/07/23.
//

import SwiftUI
import AVFoundation
import CoreData

struct SpeechCard: View {
    @State private var currentDate = Date()
    @State var isTimerRunning = false
    @Binding var showTranscript: Bool
    @State private var isRecording: Bool = false
    @State var content: String
    @Binding var isListening: Bool
    @State var interval = TimeInterval()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var speechRecognizer: SpeechRecognizer
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: currentDate)
    }
    @State var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                if isListening {
                    Rectangle()
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .frame(height: 356)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            VStack(spacing: 20) {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Text("\(formattedDate)")
                                            .foregroundColor(.black)
                                            .bold()
                                            .padding(.leading, 65)
                                        Text(formatter.string(from: interval) ?? "")
                                            .font(Font.system(.caption))
                                            .onReceive(timer) { _ in
                                                if self.isRecording {
                                                    interval = Date().timeIntervalSince(currentDate)
                                                }
                                            }
                                            .onAppear {
                                                if !isRecording {
                                                    currentDate = Date()
                                                }
                                                isRecording.toggle()
                                            }

                                            .padding(.leading, 65)
                                    }
                                    Spacer()
                                    Button {
                                        isListening = false
                                        showTranscript.toggle()
                                    } label: {
                                        Rectangle()
                                            .foregroundColor(Color.green)
                                            .cornerRadius(20)
                                            .frame(width: 70, height: 31)
                                            .overlay {
                                                Text("Done")
                                                    .foregroundColor(Color.white)
                                            }
                                    }
                                }
                                .padding()
                                if isRecording {
                                    SoundBarView()
                                }
                                Button {
                                    if !isRecording {
                                        speechRecognizer.transcribe()
                                    } else {
                                        speechRecognizer.stopTranscribing()
                                    }
                                    isRecording.toggle()
                                    print("mulai record")
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(Color("Primary"))
                                            .frame(width: 110, height: 105)
                                            .padding()
                                        Circle()
                                            .fill(isRecording ? Color("purples") : Color("Primary"))
                                            .frame(width: 100, height: 100)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.white, lineWidth: 2)
                                            )
                                        //                                Image("pause")
                                        (isRecording ? Image("pause") : Image("Voice"))
                                            .resizable()
                                            .frame(width: 30, height: 35)
                                            .foregroundColor(Color.white)
                                            .padding(20)
                                    }
                                }
                            }
                                .transition(.opacity.combined(with: .move(edge: .bottom)))
                        )
                        .onAppear {
                            if isListening {
                                speechRecognizer.transcribe()
                            }
                        }
                }
            }  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .animation(.easeInOut, value: isListening)
        }
    }
}
