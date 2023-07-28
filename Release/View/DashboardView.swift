//
//  DashboardView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct DashboardView: View {
    @State var splashFinishAnimated = false
    @State var tabViewIndex = 0

    @AppStorage("avatar") var avatarImage: String = "a"
    @AppStorage("username") var username: String = "Samsul"
    @AppStorage("isOnboarding") var isOnboarding: Bool = false

    @State var time: Timer?
    

    @State var emotionsIndex: Int = 0
    var body: some View {
        VStack{
            HStack{
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 65, height: 65)
                        Image(avatarImage).resizable().frame(width: 60, height: 60)
                    }.padding(.leading, 20)
                    Text(username.capitalized).font(.custom("Poppins-SemiBold", size: 17)).padding(.leading, 10)
                        .lineLimit(1)
                }
                Spacer()
                NavigationLink{
                    AngerJourneyView()
                        .navigationTitle("Anger Journey")
                        .navigationBarTitleDisplayMode(.inline)
                }label: {
                    Image("Calender-icon").resizable().frame(width: 20, height: 20)
                }.frame(alignment: .trailing).padding(.trailing, 20)
            }.frame(height: 90)

            TabView(selection: $tabViewIndex){
                Subtitle1(username: username)
                    .tag(0)
                    .highPriorityGesture(DragGesture()) // <== modifier to disable drag gesture
                Subtitle2()
                    .tag(1)
                    .highPriorityGesture(DragGesture())
                Subtitle3()
                    .tag(2)
                    .highPriorityGesture(DragGesture())
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 150)
            Image("Mora").resizable().frame(width: splashFinishAnimated ? 250 : 100, height: splashFinishAnimated ? 250 : 100)
                .scaleEffect()
            Spacer()
            NavigationLink{
                StartingMoodView()
            }label: {
                Text("Continue")
                    .font(.custom("Poppins-Medium", size: 17))
                    .frame(width:320, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(radius: 20, corners: .allCorners).shadow(radius:3, x: 0, y: 5)
            }
            .padding(.top, 50)
                Spacer()
            Spacer()
        }
        .onAppear{
            // Set isOnboarding value
            isOnboarding = true

            DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation{

                    splashFinishAnimated = true
                }
            }

            // Automatically change display on dashboardView
            time = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true, block: { _ in
                withAnimation(.easeInOut){
                    rotateSubtitle()
                }})
        }.onDisappear{
            // Turn of the timer when view disappear
            time?.invalidate()
        }.navigationBarBackButtonHidden()}

    // Automate TabView  on Dashboard
    func rotateSubtitle(){

        if tabViewIndex == 3{
            tabViewIndex = 0
        } else {
            tabViewIndex += 1
        }
    }
}

//
//struct DashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}
