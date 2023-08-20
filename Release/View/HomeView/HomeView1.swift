//
//  HomeView1.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 22/07/23.
//

import SwiftUI

struct HomeView1: View {
    @AppStorage("username") var username = ""
    var body: some View {
        VStack {
            Text("Hi, I am Mora!")
                .font(.custom("Poppins-SemiBold", size: 20))
            Text("How are you feeling today,\(username)?")
                .font(.custom("Poppins-Medium", size: 18))
                .padding(.top, 10)
            Image("doggo").resizable().frame(width: 187, height: 240)
                .padding(.top, 63)
        }
    }
}

struct HomeView1_Previews: PreviewProvider {
    static var previews: some View {
        HomeView1()
    }
}
