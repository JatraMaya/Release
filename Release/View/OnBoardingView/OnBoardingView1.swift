//
//  OnBoardingView1.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct OnBoardingView1: View {
    @Binding var value: Int
    var body: some View {
        ZStack{
            Color("Purple").ignoresSafeArea()
            VStack{
                Spacer()
                NavigationLink(destination: MyProfileVIew(), label: {
                    Text("Skip")
                        .foregroundColor(Color.white)
                }).padding(.leading, 310)
                Spacer()
                Text("Verbalize Your Anger").font(.custom("Poppins-Black", size: 30)).fontWeight(.medium).foregroundColor(Color.white).padding(.bottom)
                Text("No more suppressed anger.").font(.custom("Poppins-Black", size: 18))
                    .foregroundColor(Color.white)
                Text("Let yourself say everything out loud.").font(.custom("Poppins-Black", size: 18))
                    .foregroundColor(Color.white)
                Image("Anger").resizable().frame(width: 330, height: 330).padding(.bottom, 72).padding(.top, 27)
                Button{
                    withAnimation {
                        value += 1
                    }

                }label: {
                    Text("Next").frame(width: 140, height: 55).background(.white).foregroundColor(Color("Primary")).cornerRadius(radius: 30, corners: .allCorners).shadow(color: .black, radius:3, x: 0, y: 3)
                }
                Spacer()
            }
        }
    }
}

struct OnBoardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView1(value: .constant(1))
    }
}
