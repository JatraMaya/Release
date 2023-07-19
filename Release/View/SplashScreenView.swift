//
//  SplashScreenView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color("LightPurple").ignoresSafeArea()
            Image("SplashShape").resizable().padding(.top, 350).ignoresSafeArea()
            VStack{
                Spacer()
                Image("Anger").resizable().frame(width: 220, height: 220)
                Text("Welcome to Release!")
                    .font(.custom("Poppins-Black", size: 28))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10)
                Text("Vent it Out.").font(.custom("Poppins-Black", size: 18)).foregroundColor(Color.white).padding(.bottom, 0.1)
                Text("Stress less. Express more.").font(.custom("Poppins-Black", size: 18)).foregroundColor(Color.white)
                Spacer()
                Spacer()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
