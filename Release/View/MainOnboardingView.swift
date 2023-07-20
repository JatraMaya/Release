//
//  MainOnboardingView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct MainOnboardingView: View {
    @State private var tabViewIndex = 0
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    var body: some View {
        ZStack{
            Color("Purple")
            TabView(selection: $tabViewIndex){
                OnBoardingView1(value: $tabViewIndex).tag(0)
                OnBoardingView2(value: $tabViewIndex).tag(1)
                OnBoardingView3().tag(2)
            }.tabViewStyle(PageTabViewStyle())
        }.ignoresSafeArea()
    }
}

struct MainOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        MainOnboardingView()
    }
}
