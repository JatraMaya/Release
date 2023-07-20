//
//  DashboardView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct DashboardView: View {
    let emotions: [String] = ["Angry", "Sad", "Furious", "Dissapointed"]
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @AppStorage("avatar") var avatarImage: String = "a"
    @State var emotionsIndex: Int = 0
    var username: String = "edi"
    var body: some View {
            VStack{
                HStack(spacing: 200){
                    HStack{
                        ZStack{
                            Circle().frame(width: 65, height: 65)
                            Image(avatarImage).resizable().frame(width: 60, height: 60)
                        }
                        Text("Hi,").font(.custom("Poppins-Black", size: 20)).fontWeight(.medium)
                        Text(username.capitalized).fontWeight(.bold)
                    }
                    NavigationLink{}label: {
                        Image("Calender-icon").resizable().frame(width: 20, height: 20)
                    }
                }.padding(.top, 10)
                Spacer()
                Text("How are you feeling today?").font(.custom("Poppins-Black", size: 28)).fontWeight(.semibold).frame(width: 250).multilineTextAlignment(.center)
Spacer()
                Button{}label: {
                    ZStack{
                        Circle().frame(width: 200).foregroundColor(Color("Primary"))
                        Text(emotions[emotionsIndex]).font(.custom("Poppins-Black", size: 28)).fontWeight(.medium).foregroundColor(.white)
                    }
                }
                Spacer()
                Spacer()
            }
            .onAppear{

                isOnboarding = true
                // Activate timet to run generateNum function every second
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                    withAnimation{
                        generateNum()
                    }

                    })
            }
            .onDisappear{
                // Turn of the timer when view disappear
                Timer.cancelPreviousPerformRequests(withTarget: generateNum())
            }.navigationBarBackButtonHidden()

    }

    // Randomize the text inside the circle
    func generateNum(){
        emotionsIndex = Int.random(in: 0..<emotions.count)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
