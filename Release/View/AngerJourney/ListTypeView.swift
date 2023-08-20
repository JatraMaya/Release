//
//  ListTypeView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI
import CoreData

struct ListTypeView: View {
    var journal: [JournalModel] = [
        JournalModel(moodBefore: "😠", moodAfter: "🤬",
                     content: "Lorem ipsum dolor sit amet", date: Date()),
        JournalModel(moodBefore: "😔", moodAfter: "😡",
                     content: "hahahahahax", date: Date()),
        JournalModel(moodBefore: "😍", moodAfter: "🙂",
                                                                         content: "hahahahaha", date: Date()),
        JournalModel(moodBefore: "🤬", moodAfter: "😡",
                     content: "Lorem ipsum dolor sit amet", date: Date()),
        JournalModel(moodBefore: "😒", moodAfter: "😔",
                     content: "hahahahaha, masalah lorem ipsum dolret sit amet", date: Date())]
    @StateObject var coreDataViewModel: CoreDataViewModel
    var body: some View {
        VStack {
            ScrollView {
                if coreDataViewModel.savedEntities.isEmpty {
                    ListTypeViewEmpty()
                } else {
                    ForEach(Array(coreDataViewModel.savedEntities.enumerated()),
                            id: \.element) { index, mood in
                        JournalView(moodBefore: mood.mood ?? "",
                                         moodAfter: mood.endMood ?? "", content: mood.content ?? "",
                                         index: index, date: mood.date ?? Date())
                            .padding(.trailing, 10)
                    }
                }
            }.scrollIndicators(.hidden)
        }.onAppear {
            print(journal)
        }
    }
}

struct ListTypeViewEmpty: View {
    var body: some View {
        VStack {
            Spacer()
            Image("AngerJourney")
                .resizable()
                .frame(width: 300, height: 300)
            Spacer()
            Text("It's empty")
                .font(.custom("Poppins-SemiBold", size: 18))
                .frame(height: 25)
            Text("Looks like everything is fine so far..")
                .font(.custom("Poppins", size: 18))
        }.frame(height: UIScreen.main.bounds.height / 2)
    }
}
