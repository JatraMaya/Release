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
        JournalModel(moodBefore: "😠", moodAfter: "🤬", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", date: Date()),
        JournalModel(moodBefore: "😔", moodAfter: "😡", content: "hahahahahax", date: Date()), JournalModel(moodBefore: "😍", moodAfter: "🙂", content: "hahahahaha", date: Date()),
        JournalModel(moodBefore: "🤬", moodAfter: "😡", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", date: Date()),
        JournalModel(moodBefore: "😒", moodAfter: "😔", content: "hahahahaha, masalah lorem ipsum dolret sit amet, somedipa, semotthing, is in the way and I don't know what I'm trying to ", date: Date())]
    
    @StateObject var coreDataViewModel: CoreDataViewModel
    
    var body: some View {
        VStack{
            ScrollView{
                
                if coreDataViewModel.savedEntities.isEmpty {
                    ListTypeViewEmpty()
                }else {
                    ForEach(Array(coreDataViewModel.savedEntities.enumerated()) , id: \.element) { i, j in
                        JournalViewModel(moodBefore: j.mood ?? "", moodAfter: j.endMood ?? "", content: j.content ?? "", index: i, date: j.date ?? Date())
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
        VStack{
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
//
//struct ListTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListTypeView()
//    }
//}
