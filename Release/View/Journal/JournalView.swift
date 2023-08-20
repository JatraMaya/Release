//
//  JournalViewModel.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct JournalView: View {
    var moodBefore: String = "😠"
    var moodAfter: String = "🤬"
    var content: String = "some content"
    var index: Int = 0
    var date: Date = Date()

    var body: some View {
        VStack {
            MoodWithCalenderView(moodBefore: moodBefore, moodAfter: moodAfter, date: date)
            JournalContentView(content: content, index: index)
        }
        .padding(.bottom, 20)
    }
}

struct JournalViewModel_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
