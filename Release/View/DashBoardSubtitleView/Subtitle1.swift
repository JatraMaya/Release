//
//  Subtitle1.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct Subtitle1: View {
    @AppStorage("username") var username: String = "Samsul"
    var body: some View {
        VStack{
            Text("Hi, I am Mora!")
                .font(.custom("Poppins-SemiBold", size: 20))
                .padding(.bottom, 10)
            HStack{
                Text("How are you feeling today,")
                    .font(.custom("Poppins-Medium", size: 18))
                Text(username)
                    .font(.custom("Poppins-Medium", size: 18))
                    .foregroundColor(Color("Primary"))
                Text("?")
                .font(.custom("Poppins-Medium", size: 18))                    }

        }
    }
}

struct Subtitle1_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle1()
    }
}
