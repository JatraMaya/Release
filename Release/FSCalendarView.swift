//
//  FSCalenddarView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    @State var reservedDates: [JournalModel] = []

    init(_ reservedDates: [JournalModel]) {
        self.reservedDates = reservedDates
    }

    func makeCoordinator() -> Coordinator{
        return Coordinator(reservedDates)
    }

    func makeUIView(context: Context) -> some UIView {
        let calendar = FSCalendar()
        // Delegate & Data source
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator

        // Event Options
        calendar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
        calendar.appearance.todayColor = UIColor.systemGreen
        calendar.today = nil
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20)
        calendar.appearance.titlePlaceholderColor = UIColor.white
        calendar.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesUpperCase
        calendar.appearance.headerSeparatorColor = nil
        calendar.pagingEnabled = false
        calendar.scrollDirection = .horizontal

        return calendar
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    final class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
        let reservedDates: [JournalModel]

        init(_ dates: [JournalModel]) {
            self.reservedDates = dates
        }

        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            print("selected")
        }




    }
}
