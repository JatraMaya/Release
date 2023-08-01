//
//  SpeakView.swift
//  Release
//
//  Created by mora hakim on 19/07/23.
//

import SwiftUI
import RealityKit
import ARKit
import EventKit


struct SpeakView: View {
    @State private var isPlacementEnabled = false
//    @State private var selectedModel: Model?
//    @State private var modelConfirmedForPlacement: Model?
    @State private var isRecording: Bool = false
    @State private var showTranscript: Bool = false


//    private var models: [Model] = {
//        let fileManager = FileManager.default
//
//        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
//            return []
//        }
//
//        var availableModels: [Model] = []
//        for filename in files where filename.hasSuffix("Experienc") {
//            let modelName = filename.replacingOccurrences(of: "Experience", with: "")
//            let model = Model(modelName: modelName)
//            availableModels.append(model)
//        }
//        return availableModels
//
//    }()
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ARViewContainer().ignoresSafeArea(.all)
    //            if self.isPlacementEnabled {
    //                PlacementBodyAR(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel)
    //            }else {
                ModelPickerView()
    //                ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmeForPlacement: $modelConfirmedForPlacement, models: self.models)
                    
                }
        }.navigationBackButton(color: .white)
       

        }
    }


struct PlacementBodyAR: View {
//    @Binding var isPlacementEnabled: Bool
//    @Binding var selectedModel: Model?
    @State private var isMic: Bool = false
    @State private var isListening = false
    @State var showTranscript: Bool = false
    @State var isHome: Bool = false
    @StateObject private var speechRecognizer = SpeechRecognizer()
    

    var body: some View {
        if isMic {
            if !isListening {
                TextARThree()
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
                    //                }.sheet(isPresented: $isListening) {
                    //                    if #available(iOS 16.0, *) {
                    //                        Spacer()
                    //                        Spacer()
                    //                        SpeechPause(showTranscript: $showTranscript, speechRecognizer: speechRecognizer, content: "", isListening: $isListening)
                    //                            .presentationDragIndicator(.hidden)
                    //                            .presentationDetents([.medium])
                    //
                    //                    }
                    //                }
                    
                    SpeechPause(showTranscript: $showTranscript, speechRecognizer: speechRecognizer, content: "", isListening: $isListening)
               
                        
                        .navigationDestination(isPresented: $showTranscript) {
                            EndMoodView(speechRecognizer: speechRecognizer, showTranscript: showTranscript)
                        }
                
            
            
        } else {
            TextARTwo()
                .padding(.bottom, 710)
            HStack {
                    Button {
                        print("DEBUG: Cancel model placement")
//                        self.resetPlacementParameters()
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
    
//    func resetPlacementParameters() {
//        self.isPlacementEnabled = false
//        self.selectedModel = nil
//    }
}




struct ModelPickerView: View {
    @State private var isButtonVisible = true
    
    var body: some View {
        if isButtonVisible {
            ZStack {
                    TextAR()
                         .padding(.bottom, 605)
               
                    Button {
                        print("DEBUG: selected model with name:")
                      
                        isButtonVisible = false
                    } label: {
                        Image("Frame")
                            .resizable()
                            .frame(width: 100, height: 100.5)
                            .foregroundColor(Color.gray)
                            .aspectRatio(1/1, contentMode: .fit)
                            .cornerRadius(12)
                    }
                
                        
                    
                    }
            .frame(maxHeight: .infinity)

        } else {
            PlacementBodyAR()
        }
            
        }
//    func resetPlacementParameters() {
//        self.isPlacementEnabled = false
//        self.selectedModel = nil
//    }
        
    }


struct TextAR: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Scan Room")
                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                .foregroundColor(Color.white)
            ZStack {
                AnimationRelease()
                Image("ScanRoom")
                    .resizable()
                    .frame(width: 40, height: 78)
            }
            Text("Tap anywhere to place Mora! ").font(.custom("Poppins-Black", size: 12)).foregroundColor(Color.white)
        }.frame(maxHeight: .infinity)
    }
}

struct TextARTwo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Scan Room")
                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            Rectangle()
                .fill(Color("Primary").opacity(0.5))
                .cornerRadius(20)
                .frame(width: 200, height: 27)
                .overlay {
                    HStack {
                        Text("Press").font(.custom("Poppins", size: 12)).foregroundColor(Color.white)
                        Image("checkspeak")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("button to continue").font(.custom("Poppins", size: 12)).foregroundColor(Color.white)
                    }
                }
        }.frame(maxHeight: .infinity)
        Spacer()
    }
}

struct TextARThree: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Start Talking")
                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                .foregroundColor(Color.white)
            Rectangle()
                .fill(Color("Primary").opacity(0.5))
                .cornerRadius(20)
                .frame(width: 200, height: 44)
                .overlay {
                    VStack(spacing: 10) {
                        Text("Let’s vent it all out. ").font(.custom("Poppins-Black", size: 12)).foregroundColor(Color.white)
                        Text("I am all ears.").font(.custom("Poppins-Black", size: 12)).foregroundColor(Color.white)
                    }
                }
        }.frame(maxHeight: .infinity)
        Spacer()
    }
}

struct AnimationRelease: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("Primary").opacity(0.5))
                .frame(width: 100, height: 100)
                .scaleEffect(isAnimating ? 1.5 : 1.0)
                .animation(Animation.easeInOut(duration: 1.0))
            
            Circle()
                .fill(Color("Primary"))
                .frame(width: 70, height: 70)
                .scaleEffect(isAnimating ? 1.3 : 1.0)
                .animation(Animation.easeInOut(duration: 1.5))
        }
        }
    }



struct Note: Identifiable {
    let id = UUID()
    let content: String
    let createdAt: Date
}


//struct SpeakView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpeakView()
//    }
//}


struct NavigationBackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))
                        Text("Back")
                            .foregroundColor(Color(color))

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}
extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}
