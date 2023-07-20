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
            Color("Primary").ignoresSafeArea()
            VStack{
//                Text("Skip")
//                    .foregroundColor(Color.white)
                Text("Verbalize Your Anger").font(.custom("Poppins-Black", size: 30)).fontWeight(.medium).foregroundColor(Color.white).padding(.bottom)
                Text("No more suppressed anger.").font(.custom("Poppins-Black", size: 18))
                    .foregroundColor(Color.white)
                Text("Let yourself say everything out loud.").font(.custom("Poppins-Black", size: 18))
                    .foregroundColor(Color.white)
                Image("Anger").resizable().frame(width: 330, height: 330)
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

struct OnBoardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView1(value: .constant(1))
    }
}
