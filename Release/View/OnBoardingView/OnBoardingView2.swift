//
//  OnBoardingView2.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct OnBoardingView2: View {
    @Binding var value: Int
    var body: some View {
        ZStack{
            Color("Purple").ignoresSafeArea()
            VStack{
                Spacer()
                NavigationLink(destination: MyProfileVIew(), label: {
                    Text("Skip").font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                }).padding(.leading, 310)
                Spacer()
                Text("Track Your Anger").font(.custom("Poppins-Medium", size: 30)).fontWeight(.medium).foregroundColor(Color.white).padding(.bottom)
                Text("Your daily journal, unlike no other").font(.custom("Poppins", size: 18))
                    .foregroundColor(Color.white)
                Text("No need to type anything, just talk.").font(.custom("Poppins", size: 18))
                    .foregroundColor(Color.white)
                Image("Books").resizable().frame(width: 330, height: 330).padding(.bottom, 72).padding(.top, 27)
                Button{
                    withAnimation {
                        value += 1
                    }

                }label: {
                    Text("Next").font(.custom("Poppins-Medium", size: 17))
                        .frame(width: 140, height: 55).background(.white).foregroundColor(Color("Primary")).cornerRadius(radius: 30, corners: .allCorners).shadow(color: .black, radius:3, x: 0, y: 3)
                }
                Spacer()
            }
        }
    }
}

struct OnBoardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView2(value: .constant(1))
    }
}
