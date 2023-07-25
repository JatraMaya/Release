//
//  ListTypeView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct ListTypeView: View {
//    var journal: [JournalModel] = []
    var journal: [JournalModel] = [
        JournalModel(moodBefore: "😠", moodAfter: "🤬", content: "hahahahaha, masalah lorem ipsum dolret sit amet, somedipa, semotthing, is in the way and I don't know what I'm trying to ", date: Date()),
        JournalModel(moodBefore: "😔", moodAfter: "😡", content: "hahahahahax", date: Date()), JournalModel(moodBefore: "a", moodAfter: "b", content: "hahahahaha", date: Date()),
        JournalModel(moodBefore: "🤬", moodAfter: "😡", content: "hahahahaha, masalah lorem ipsum dolret sit amet, somedipais in the way and I don't know what I'm trying to ", date: Date()),
        JournalModel(moodBefore: "😒", moodAfter: "😔", content: "hahahahaha, masalah lorem ipsum dolret sit amet, somedipa, semotthing, is in the way and I don't know what I'm trying to ", date: Date())]
    var body: some View {
        VStack{
            ScrollView{
                if journal.count == 0 {
                    Text("Empty")
                }else {
                    ForEach(Array(journal.enumerated()), id: \.element) { i, j in

                        JournalViewModel(moodBefore: j.moodBefore, moodAfter: j.moodAfter, content: j.content, index: i, date: j.date)

                    }
                }

            }
        }
    }
}

struct ListTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ListTypeView()
    }
}
