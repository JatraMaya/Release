//
//  DateDisplayView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI

struct DateDisplayViewModel: View {
    var date: Date = Date()
    var body: some View {
        HStack{
                Text("\(date.formatted(.dateTime.weekday(.abbreviated))),")
                Text(date.formatted(.dateTime.day().month().year().locale(Locale(identifier: "id_ID"))))
        }
        .frame(width: 200, alignment: .trailing)
    }
}

struct DateDisplayViewModel_Previews: PreviewProvider {
    static var previews: some View {
        DateDisplayViewModel()
    }
}
