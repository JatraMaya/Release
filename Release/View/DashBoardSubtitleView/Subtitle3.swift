//
//  Subtitle3.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct Subtitle3: View {
    var body: some View {
        VStack{
            Text("Don’t afraid.")
                .font(.custom("Poppins-Medium", size: 18))
            Text("I won’t judge! I am here for you")
                .font(.custom("Poppins-Medium", size: 18))
            Text("So, let’s vent it out, shall we?")
                .font(.custom("Poppins-Medium", size: 18))

        }
    }
}

struct Subtitle3_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle3()
    }
}
