//
//  JournalViewModel.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct JournalViewModel: View {
    var moodBefore: String = "angry"
    var moodAfter: String = "furious"
    var content: String = "some content"
    var index: Int = 1
   var date: Date = Date()
    var body: some View {
        VStack{
            HStack{
                Spacer()
                ZStack{
                    Circle()
                        .fill(Color("Primary"))
                        .frame(width: 32, height: 32)
                    Image(moodAfter).resizable().frame(width: 30, height: 30)
                }

                Image(systemName: "arrow.right").foregroundColor(Color("Primary"))
                ZStack{
                    Circle()
                        .fill(Color("Primary"))
                        .frame(width: 32, height: 32)
                    Image(moodBefore).resizable().frame(width: 30, height: 30)
                }
                Spacer()
                Text(date.formatted(.dateTime.weekday(.wide).day().month().year()))
                Spacer()
            }
            HStack{
                Spacer()
                Spacer()
                Divider()
                    .frame(minWidth: 3)
                    .background(Color("Primary")).opacity(0.5)
                Spacer()
                Spacer()
                Text(content)
                    .font(.custom("Poppins", size: 12))
                    .padding([.leading, .trailing], 10)
                    .frame(width: 280, height: 90, alignment: .leading)
                    .foregroundColor(index % 2 == 0 ? .white : .black)
                    .background(index % 2 == 0 ? Color("Primary") : .white)
                    .cornerRadius(radius: 25, corners: .allCorners)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(index % 2 == 0 ? .blue : Color("Primary"), lineWidth: 2).opacity(index % 2 == 0 ? 0 : 1)
                    )

//                    .border(index % 2 == 0 ? .white : Color("Primary"))

            }.frame(width: 300, height: 100, alignment: .center)
//                .padding(.bottom, 10)
//                .background(.black)
        }
    }
}

struct JournalViewModel_Previews: PreviewProvider {
    static var previews: some View {
        JournalViewModel()
    }
}
