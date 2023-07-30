//
//  EndMoodView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct EndMoodView: View {
    @AppStorage("endMood") var endMood = ""
    
    let moods: [MoodModel] = [
        MoodModel(image: "😊", text: "good", color: "Lime"),
        MoodModel(image: "😆", text: "happy", color: "Yellow"),
        MoodModel(image: "😌", text: "calm", color: "Pink"),
        MoodModel(image: "😳", text: "Embarrassed", color: "LigthPurple"),
        MoodModel(image: "😢", text: "Sad", color: "Sky"),
        MoodModel(image: "😒", text: "annoyed", color: "Green"),
        MoodModel(image: "😔", text: "Upset", color: "Blue"),
        MoodModel(image: "😠", text: "angry", color: "Primary"),
        MoodModel(image: "😡", text: "mad", color: "Orange"),
        MoodModel(image: "🤬", text: "Furious", color: "Red")]

    @State var selectedMood: String = ""
    @StateObject var coreDataViewModel = CoreDataViewModel()
    var speechRecognizer: SpeechRecognizer
    @State var showTranscript: Bool
    
    var body: some View {
        VStack{
//            Spacer()
            Text("So...")
                .font(.custom("Poppins-SemiBold", size: 20))
                .padding()
            Text("After talking with Mora")
                .font(.custom("Poppins-Medium", size: 18))
            Text("How are you feeling now?")
                .font(.custom("Poppins-Medium", size: 18))
                .padding(.bottom, 50)
            ScrollView{
                ForEach(moods, id:\.self) { mood in
                    Button{
                        endMood = mood.image
                        
                    }label: {
                        MoodViewModel(mood: mood, moodIsSelected: endMood == mood.image ? true : false)
                            .foregroundColor(.black)
                            .padding([.top, .bottom], 5)
                    }


                }
            }.frame(height: UIScreen.main.bounds.height - 455)
            Spacer()
            NavigationLink{
                SpeechTextView(content: speechRecognizer.transcript, showTranscript: $showTranscript)
            }label: {
                Text("Continue")
                    .font(.custom("Poppins-Medium", size: 17))
                    .frame(width:320, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(radius: 20, corners: .allCorners).shadow(radius:3, x: 0, y: 5)
                    .padding(.bottom, 50)

            }
            .disabled(endMood.isEmpty)
            .opacity(endMood.isEmpty ? 0.6 : 1)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct EndMoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EndMoodView()
//    }
//}
