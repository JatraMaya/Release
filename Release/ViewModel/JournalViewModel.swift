//
//  JournalViewModel.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct JournalViewModel: View {
    var moodBefore: String = "a"
    var moodAfter: String = "a"
    var content: String = "some content"
    var index: Int = 1
   var date: Date = Date()
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(moodAfter).resizable().frame(width: 30, height: 30)
                Image(systemName: "arrow.right").foregroundColor(Color("Primary"))
                Image(moodBefore).resizable().frame(width: 30, height: 30)
                Spacer()
                Text(date.formatted(.dateTime.weekday(.wide).day().month().year()))
                Spacer()
            }
            HStack{
//                Spacer()
                Divider()
                    .frame(minWidth: 3)
                    .background(Color("Primary")).opacity(0.5)
//                Text("\(index)")
                Text(content)

                    .padding(.leading, 50)
                    .frame(width: 300, height: 80, alignment: .leading)

                    .foregroundColor(index % 2 == 0 ? .white : .black)
                    .background(index % 2 == 0 ? Color("Primary") : .white).cornerRadius(radius: 20, corners: .allCorners)
                    .cornerRadius(radius: 10, corners: .allCorners)
                    .border(index % 2 == 0 ? .white : Color("Primary"))

            }.frame(width: 350, height: 114, alignment: .center)
                .padding(.bottom, 10)
        }
    }
}

struct JournalViewModel_Previews: PreviewProvider {
    static var previews: some View {
        JournalViewModel(moodBefore: "a", date: Date())
    }
}
