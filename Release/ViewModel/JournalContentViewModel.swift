//
//  JournalContentViewModel.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct JournalContentViewModel: View {
    var content: String = ""
    var index: Int = 0
    var body: some View {
        HStack{
            Spacer()
            Spacer()
            Divider()
                .frame(minWidth: 3)
                .background(Color("Primary")).opacity(0.5)
            Spacer()
            Spacer()
            Text(content)
                .lineLimit(4)
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
        }
        .frame(width: 200, height: 100, alignment: .center)

    }
}

struct JournalContentViewModel_Previews: PreviewProvider {
    static var previews: some View {
        JournalContentViewModel(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}
