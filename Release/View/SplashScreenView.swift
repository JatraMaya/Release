//
//  SplashScreenView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State var animate: Bool = false
    var body: some View {
        ZStack{
            Color("LighterPurple").ignoresSafeArea()
            Image("SplashShape").resizable().padding(.top, 350).ignoresSafeArea()
            VStack{
                Spacer()
                Image("MoraSplash").resizable().frame(width: animate ? nil : 220, height: animate ? nil : 220).opacity(animate ? 0 : 1)
                Text("Welcome to")
                    .font(.custom("Poppins-semiBold", size: 28))
                    .foregroundColor(Color.white)
                    .opacity(animate ? 0 : 1)
                Text("Release!")
                    .font(.custom("Poppins-semiBold", size: 28))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10)
                    .opacity(animate ? 0 : 1)
                Text("Vent it Out. Express more.").font(.custom("Poppins", size: 18)).foregroundColor(Color.white).padding(.top, 30)
                    .opacity(animate ? 0 : 1)
                Spacer()
                Spacer()
            }
        }
        .onAppear(perform: animateSplash)
    }
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 0.45)){
                animate = true
            }
        }
    }

}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
