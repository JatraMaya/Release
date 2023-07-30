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
        ZStack {
            Color("LighterPurple").ignoresSafeArea()

            // Splash Shape with delay and animation
            Image("SplashShape")
                .resizable()
                .padding(.top, animate ? 350 : 900)
                .animation(Animation.easeInOut(duration: 1).delay(1))
                .ignoresSafeArea()

            VStack {
                Spacer()
                Image("MoraSplash")
                    .resizable()
                    .frame(width: animate ? 220 : 300, height: animate ? 220 : 300) // Reduce the size after animation
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : -100)
                    .scaleEffect(animate ? 0.8 : 1.2) // Add scale effect after animation
                    .animation(Animation.easeInOut(duration: 0.45).delay(1.5))

                Text("Welcome to")
                    .font(.custom("Poppins-semiBold", size: 28))
                    .foregroundColor(Color.white)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : -50)
                    .animation(Animation.easeInOut(duration: 0.45).delay(1.8))

                Text("Release!")
                    .font(.custom("Poppins-semiBold", size: 28))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : -30)
                    .animation(Animation.easeInOut(duration: 0.45).delay(2.1))

                Text("Vent it Out. Express more.")
                    .font(.custom("Poppins", size: 18))
                    .foregroundColor(Color.white)
                    .padding(.top, 30)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : -10)
                    .animation(Animation.easeInOut(duration: 0.45).delay(2.4))

                Spacer()
                Spacer()
            }
        }
        .onAppear(perform: animateSplash)
    }

    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(.easeInOut(duration: 0.30)) {
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
