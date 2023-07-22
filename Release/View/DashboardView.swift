//
//  DashboardView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct DashboardView: View {
    let emotions: [String] = ["Angry", "Sad", "Furious", "Dissapointed"]
    @State private var tabViewIndex = 0
    @AppStorage("avatar") var avatarImage: String = "a"
    @AppStorage("username") var username: String = "Samsul"

    @State var emotionsIndex: Int = 0
    var body: some View {
        VStack{
            HStack{
                HStack{
                    ZStack{
                        Circle().frame(width: 65, height: 65)
                        Image(avatarImage).resizable().frame(width: 60, height: 60)
                    }.padding(.leading, 20)
                    Text(username.capitalized).font(.custom("Poppins-bold", size: 20)).padding(.leading, 10)
                }
                Spacer()
                NavigationLink{}label: {
                    Image("Calender-icon").resizable().frame(width: 20, height: 20)
                }.frame(alignment: .trailing).padding(.trailing, 20)
            }.padding(.top, 10)
            TabView(selection: $tabViewIndex){
                HomeView1(username: username).tag(0)
                HomeView2().tag(1)
                HomeView3().tag(2)
            }.tabViewStyle(PageTabViewStyle())
            NavigationLink{}label: {
                Text("Start Talk")
                    .font(.custom("Poppins-Medium", size: 17))
                    .frame(width:320, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(radius: 20, corners: .allCorners).shadow(radius:3, x: 0, y: 5)
                    .padding(.bottom, 100)
            }
                Spacer()
        }
        .onAppear{
            setupAppearanceTabViewIndicator()
            // Automatically change display on dashboardView
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                withAnimation(.easeInOut){
                    automateTabView()
                }

                })

        }.onDisappear{
                    // Turn of the timer when view disappear
                    Timer.cancelPreviousPerformRequests(withTarget: automateTabView())
        }.navigationBarBackButtonHidden()
}

    // Automate TabView  on Dashboard
    func automateTabView(){

        if tabViewIndex == 3{
            tabViewIndex = 0
        } else {
            tabViewIndex += 1
        }
//        tabViewIndex = Int.random(in: 0..<emotions.count)
    }

    // Setup tab view indicator color
    func setupAppearanceTabViewIndicator() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "Primary")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }

    // Refert back to default tab view indicator when leaving the view
    func refertAppearanceTabViewIndicator() {
        
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
