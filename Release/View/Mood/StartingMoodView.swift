//
//  StarttingMoodView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct StartingMoodView: View {
    let moods: [MoodModel] = [MoodModel(image: "😒", text: "annoyed", color: "Green"),
                              MoodModel(image: "😔", text: "upset", color: "Blue"),
                              MoodModel(image: "😠", text: "angry", color: "Primary"),
                              MoodModel(image: "😡", text: "mad", color: "Orange"),
                              MoodModel(image: "🤬", text: "furious", color: "Red")]
    @State private var selectedMood: String = ""
    @AppStorage("startMood") var startMood = ""
    @StateObject var coreDataViewModel = CoreDataViewModel()
    var body: some View {
        VStack {
            Spacer()
            Text("Take a minute...")
                .font(.custom("Poppins-SemiBold", size: 20))
                .padding()
            Text("Mora needs to know how are you")
                .font(.custom("Poppins-Medium", size: 18))
            Text("feeling now")
                .font(.custom("Poppins-Medium", size: 18))
                .padding(.bottom, 50)
            ForEach(moods, id: \.self) { mood in
                Button {
                    startMood = mood.image
                }label: {
                    MoodViewModel(mood: mood, moodIsSelected: startMood == mood.image ? true : false)
                        .foregroundColor(.black)
                        .padding([.top, .bottom], 5)
                }
            }
            Spacer()
            NavigationLink {
                SpeakView()
            }label: {
                Text("Start Talk")
                    .font(.custom("Poppins-Medium", size: 17))
                    .frame(width: 320, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(radius: 20, corners: .allCorners).shadow(radius: 3, x: 0, y: 5)
                    .padding(.bottom, 50)
            }
            .disabled(startMood.isEmpty)
            .opacity(startMood.isEmpty ? 0.6 : 1)
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func navigationBarColor(_ color: UIColor) -> some View {
        self.modifier(NavigationBarColorModifier(color: color))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    init(color: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = color
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    func body(content: Content) -> some View {
        content
    }
}
