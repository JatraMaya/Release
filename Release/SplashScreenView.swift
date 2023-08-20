//
//  SplashScreenView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var dashboardViewModel = DashboardViewModel()
    var body: some View {
        ZStack {
            Color("LighterPurple").ignoresSafeArea()
            withAnimation(.easeOut(duration: 1).delay(1)) {
                Image("SplashShape")
                    .resizable()
                    .padding(.top, dashboardViewModel.animate ? 350 : 900)
                    .ignoresSafeArea()
            }
            VStack {
                Spacer()
                withAnimation(.easeInOut(duration: 0.45).delay(1.5)) {
                    Image("MoraSplash")
                        .resizable()
                        .frame(width: dashboardViewModel.animate ? 220 : 300,
                               height: dashboardViewModel.animate ? 220 : 300)
                        .opacity(dashboardViewModel.animate ? 1 : 0)
                        .offset(y: dashboardViewModel.animate ? 0 : -100)
                        .scaleEffect(dashboardViewModel.animate ? 0.8 : 1.2)
                }
                withAnimation(.easeInOut(duration: 0.45).delay(1.8)) {
                    Text("Welcome to")
                        .font(.custom("Poppins-semiBold", size: 28))
                        .foregroundColor(Color.white)
                        .opacity(dashboardViewModel.animate ? 1 : 0)
                        .offset(y: dashboardViewModel.animate ? 0 : -50)
                }
                withAnimation(.easeInOut(duration: 0.45).delay(2.1)) {
                    Text("Release!")
                        .font(.custom("Poppins-semiBold", size: 28))
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                        .opacity(dashboardViewModel.animate ? 1 : 0)
                        .offset(y: dashboardViewModel.animate ? 0 : -30)
                }
                withAnimation(.easeInOut(duration: 0.45).delay(2.4)) {
                    Text("Vent it Out. Express more.")
                        .font(.custom("Poppins", size: 18))
                        .foregroundColor(Color.white)
                        .padding(.top, 30)
                        .opacity(dashboardViewModel.animate ? 1 : 0)
                        .offset(y: dashboardViewModel.animate ? 0 : -10)
                }
                Spacer()
                Spacer()
            }
        }
        .onAppear(perform: dashboardViewModel.animateSplash)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
