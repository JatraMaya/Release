//
//  Subtitle2.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct Subtitle2: View {
    var body: some View {
        VStack{
            Text("You know, it’s okay to not feeling okay.")
                .font(.custom("Poppins-Medium", size: 18))
            Text("You can tell me whatever you want.")
                .font(.custom("Poppins-Medium", size: 18))
            Text("I am all ears👂🏻")
                .font(.custom("Poppins-Medium", size: 18))
        }
    }
}

struct Subtitle2_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle2()
    }
}
