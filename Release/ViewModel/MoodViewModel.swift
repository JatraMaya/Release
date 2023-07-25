//
//  MoodView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct MoodViewModel: View {
    var mood: MoodModel = MoodModel(image: "😒", text: "Annoyed", color: "Green")
    var body: some View {
        HStack{
            Text(mood.image)
                .frame(width: 115, alignment: .center)
            Text(mood.text.capitalized)
                .frame(width: 145, alignment: .leading)
        }
        .frame(width: 300, height: 63)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(mood.color))
                .shadow(radius: 3, x: 0, y: 5)

        )
//        .background(.black)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodViewModel(mood: MoodModel(image: "😒", text: "annoyed", color: "Green"))
    }
}
