//
//  CalenderTypeView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 24/07/23.
//

import SwiftUI

struct CalenderTypeView: View {
    @State var dates: [String] = ["2023-07-01", "2023-07-29"]
    @State var selectedDate: Date?
    @State var isSheetPresented = false
    var body: some View {
        CalendarView(dates, mode: .basicCalendarMode)
    }
}

struct CalenderTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderTypeView()
    }
}
