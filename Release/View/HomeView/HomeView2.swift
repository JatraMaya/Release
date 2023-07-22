//
//  HomeView2.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 22/07/23.
//

import SwiftUI

struct HomeView2: View {
    var body: some View {
            VStack{
                Text("You know, it’s okay to not feeling okay.")
                    .font(.custom("Poppins-Medium", size: 18))
                    Text("You can tell me whatever you want.")
                        .font(.custom("Poppins-Medium", size: 18))
                    Text("I am all ears👂🏻")
                        .font(.custom("Poppins-Medium", size: 18))
                Image("doggo").resizable().frame(width: 187, height: 240)
                    .padding(.top, 46)
            }
        }
}


struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}
