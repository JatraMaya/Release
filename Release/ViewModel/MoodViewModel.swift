//
//  MoodView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct MoodViewModel: View {
    var mood: MoodModel = MoodModel(image: "😒", text: "Annoyed", color: "Green")
    var moodIsSelected: Bool = false
    var body: some View {
        HStack{
            Text(mood.image)
                .frame(width: 125, height: 63, alignment: .center)
            Text(mood.text.capitalized)
                .frame(width: 155, height: 63, alignment: .leading)
        }
        .frame(width: 300, height: 63)
        .background(moodIsSelected ? Color(mood.color) : nil)
        .cornerRadius(radius: 20, corners: .allCorners)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(mood.color))
                .shadow(radius: 3, x: 0, y: 5)
                .opacity(moodIsSelected ? 0 : 1)
        )
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodViewModel(mood: MoodModel(image: "😒", text: "annoyed", color: "Green"))
    }
}
