//
//  OnBoardingView3.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct OnBoardingView3: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        ZStack{
            Color("Purple").ignoresSafeArea()
            VStack{
                Spacer()

                Spacer()                
                Text("Be True to Yourself").font(.custom("Poppins-Medium", size: 30)).fontWeight(.medium).foregroundColor(Color.white).padding(.bottom)
                Text("A safe place for you,").font(.custom("Poppins", size: 18))
                    .foregroundColor(Color.white)
                Text("Let you have a piece of mind.").font(.custom("Poppins", size: 18))
                    .foregroundColor(Color.white)
                Image("Joy").resizable().frame(width: 330, height: 330).padding(.bottom, 72).padding(.top, 27)
                NavigationLink(destination: MyProfileVIew(), label: {
                    Text("Get Started").font(.custom("Poppins-Medium", size: 17))
                        .frame(width: 320, height: 55).background(.white).foregroundColor(Color("Primary")).cornerRadius(radius: 30, corners: .allCorners).shadow(color: .black, radius:3, x: 0, y: 3)
                })
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

//struct OnBoardingView3_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingView3()
//    }
//}
