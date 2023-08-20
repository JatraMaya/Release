//
//  HomeView3.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 22/07/23.
//

import SwiftUI

struct HomeView3: View {
    var body: some View {
            VStack {
                Text("Don’t afraid.")
                    .font(.custom("Poppins-Medium", size: 18))
                    .padding(.top, 30)
                Text("I won’t judge! I am here for you")
                    .font(.custom("Poppins-Medium", size: 18))
                Image("doggo").resizable().frame(width: 187, height: 240)
                    .padding(.top, 50)
                Text("So, let’s vent it out, shall we?")
                    .font(.custom("Poppins-SemiBold", size: 18))
            }
        }
}

struct HomeView3_Previews: PreviewProvider {
    static var previews: some View {
        HomeView3()
    }
}
