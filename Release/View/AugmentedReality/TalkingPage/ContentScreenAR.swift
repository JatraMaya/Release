//
//  ContentScreenAR.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import SwiftUI

struct FirstContent: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Scan Room")
                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                .foregroundColor(Color.white)
            ZStack {
                AnimationRelease()
                Image("ScanRoom")
                    .resizable()
                    .frame(width: 40, height: 78)
            }
            Text("Tap anywhere to place Mora! ").font(.custom("Poppins-Black", size: 12)).foregroundColor(Color.white)
        }.frame(maxHeight: .infinity)
    }
}

struct SecondContent: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Scan Room")
                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            Rectangle()
                .fill(Color("Primary").opacity(0.5))
                .cornerRadius(20)
                .frame(width: 200, height: 27)
                .overlay {
                    HStack {
                        Text("Press").font(.custom("Poppins", size: 12)).foregroundColor(Color.white)
                        Image("checkspeak")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("button to continue").font(.custom("Poppins", size: 12)).foregroundColor(Color.white)
                    }
                }
        }.frame(maxHeight: .infinity)
        Spacer()
    }
}

struct ThirdContent: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Start Talking")
                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                .foregroundColor(Color.white)
            Rectangle()
                .fill(Color("Primary").opacity(0.5))
                .cornerRadius(20)
                .frame(width: 200, height: 44)
                .overlay {
                    VStack(spacing: 10) {
                        Text("Let’s vent it all out. ").font(.custom("Poppins-Black",
                                                                     size: 12)).foregroundColor(Color.white)
                        Text("I am all ears.").font(.custom("Poppins-Black", size: 12)).foregroundColor(Color.white)
                    }
                }
        }.frame(maxHeight: .infinity)
        Spacer()
    }
}
