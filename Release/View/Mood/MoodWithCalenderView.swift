//
//  MoodBeforeAfterViewModel.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct MoodWithCalenderView: View {
    var moodBefore: String = "😁"
    var moodAfter: String = "🤪"
    var date: Date = Date()
    var body: some View {
        HStack {
            Text(moodAfter)
            Image(systemName: "arrow.right").foregroundColor(Color("Primary"))
            Text(moodBefore)
            Spacer()
            DateDisplayView(date: date)
        }
        .frame(width: 300)
    }
}

struct MoodWithCalenderViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MoodWithCalenderView()
    }
}
