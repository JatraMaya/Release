//
//  DashboardView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct DashboardView: View {
    let emotions: [String] = ["Angry", "Sad", "Furious", "Dissapointed"]
    @AppStorage("avatar") var avatarImage: String = "a"
    @AppStorage("username") var username: String = ""

    @State var emotionsIndex: Int = 0
    var body: some View {
            VStack{
                HStack(spacing: 200){
                    HStack{
                        ZStack{
                            Circle().frame(width: 65, height: 65)
                            Image(avatarImage).resizable().frame(width: 60, height: 60)
                        }
                        Text("Hi,").font(.custom("Poppins-Medium", size: 20))
                        Text(username.capitalized).font(.custom("Poppins-bold", size: 20))
                    }
                    NavigationLink{}label: {
                        Image("Calender-icon").resizable().frame(width: 20, height: 20)
                    }
                }.padding(.top, 10)
                Spacer()
                Text("How are you feeling today?").font(.custom("Poppins-SemiBold", size: 28)).frame(width: 250).multilineTextAlignment(.center)
Spacer()
                NavigationLink{
                    PrepareToTalkView()
                }label: {
                    ZStack{
                        Circle().frame(width: 200).foregroundColor(Color("Primary"))
                        Text(emotions[emotionsIndex]).font(.custom("Poppins-Medium", size: 28)).foregroundColor(.white)
                    }.shadow(radius: 5, x: 0, y: 5)
                }
                Spacer()
                Spacer()
            }
            .onAppear{
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
