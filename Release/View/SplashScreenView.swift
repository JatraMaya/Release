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
            Color("Primary").ignoresSafeArea()
            Image("SplashShape").resizable().padding(.top, 350).ignoresSafeArea()
            VStack{
                Spacer()
                Image("Anger").resizable().frame(width: 220, height: 220)
                Text("Welcome to")
                    .font(.custom("Poppins-semiBold", size: 28))
                    .foregroundColor(Color.white)
                Text("Release!")
                    .font(.custom("Poppins-semiBold", size: 28))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10)
                Text("Vent it Out. Express more.").font(.custom("Poppins", size: 18)).foregroundColor(Color.white).padding(.top, 43)
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
