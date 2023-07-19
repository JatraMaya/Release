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
            Color("Primary").ignoresSafeArea()
            VStack{
//                Text("Skip")
//                    .foregroundColor(Color.white)
                Text("Track Your Anger").font(.custom("Poppins-Black", size: 30)).fontWeight(.medium).foregroundColor(Color.white)
                Text("Your ily journal, unlike no other").font(.custom("Poppins-Black", size: 18))
                    .foregroundColor(Color.white)
                Text("No need to type anything, just talk.").font(.custom("Poppins-Black", size: 18))
                    .foregroundColor(Color.white)
                Image("Books").resizable().frame(width: 330, height: 330)
                Button{
                    withAnimation {
                        value += 1
                    }

                }label: {
                    Text("Next").frame(width: 140, height: 55).background(.white).foregroundColor(Color("Primary")).cornerRadius(radius: 30, corners: .allCorners)
                }
            }
        }
    }
}

struct OnBoardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView2(value: .constant(1))
    }
}
