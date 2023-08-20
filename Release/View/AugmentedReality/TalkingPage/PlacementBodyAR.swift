//
//  PlacementBodyAR.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import SwiftUI

struct PlacementBodyAR: View {
    @State private var isMic: Bool = false
    @State private var isListening = false
    @State var showTranscript: Bool = false
    @State var isHome: Bool = false
    @StateObject private var speechRecognizer = SpeechRecognizer()
    var body: some View {
        if isMic {
            if !isListening {
                ThirdContent()
                    .padding(.bottom, 705)
            }
            Button {
                isListening.toggle()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 110, height: 105)
                        .padding()
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 100, height: 100)
                    Image("Voice")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .padding(20)
                }
            }
            .padding(.bottom)
            SpeechCard(showTranscript: $showTranscript, content: "", isListening: $isListening,
                       speechRecognizer: speechRecognizer)
            .navigationDestination(isPresented: $showTranscript) {
                EndMoodView(speechRecognizer: speechRecognizer, showTranscript: showTranscript)
            }
        } else {
            SecondContent()
                .padding(.bottom, 710)
            HStack {
                Button {
                    print("DEBUG: Cancel model placement")
                } label: {
                    Image(systemName: "trash")
                        .frame(width: 40, height: 40)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding(20)
                }
                Button {
                    print("DEBUG: model placement confirmed")
                    isMic.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 105, height: 105)
                            .padding()
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 100, height: 100)
                        Image("Check")
                            .resizable()
                            .frame(width: 45, height: 40)
                            .foregroundColor(Color.white)
                            .cornerRadius(30)
                            .padding(20)
                    }
                }
            }
            .padding(.trailing, 70)
            .padding(.bottom, 30)
        }
    }
}
