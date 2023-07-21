//
//  PrepareTalkView1.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 20/07/23.
//

import SwiftUI

struct PrepareToTalkVIew: View {
    var body: some View {
        VStack{
            Text("Hi, I am Mora!").font(.custom("Poppins-Black", size: 20)).fontWeight(.semibold)
            Text("You know, it’s okay to not feeling okay.").font(.custom("Poppins-Black", size: 18)).fontWeight(.medium).padding(.top, 10)
            Text("You can tell me whatever you want. I am all ears👂🏻").frame(width: 210).multilineTextAlignment(.center).font(.custom("Poppins-Black", size: 18)).fontWeight(.medium)
            Image("Anger").resizable().frame(width: 187, height: 220)
            Text("Don’t afraid, I won’t judge! I am here for you.").frame(width: 208).multilineTextAlignment(.center).font(.custom("Poppins-Black", size: 15)).fontWeight(.medium).padding(.bottom, 20)
            Text("So, let’s vent it all out, shall we?").font(.custom("Poppins-Black", size: 18)).fontWeight(.semibold)
            Button{}label: {
                Text("Start Talk").font(.custom("Poppins-Black", size: 17)).fontWeight(.medium).frame(width: 140, height: 48).background(Color("Primary")).foregroundColor(.white).cornerRadius(radius: 20, corners: .allCorners)
            }.padding(.top, 8)
        }
    }
}

struct AngerJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        PrepareToTalkVIew()
    }
}
