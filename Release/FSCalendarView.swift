//
//  FSCalenddarView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    @State var reservedDates: [String] = []
    let calendarMode: CalendarMode

    init(_ reservedDates: [String], mode calendarMode: CalendarMode) {
        self.reservedDates = reservedDates
        self.calendarMode = calendarMode
    }

    func makeCoordinator() -> Coordinator {
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

    // class Coordinator: NSObject { }
    class Coordinator: NSObject, FSCalendarDelegate {
        let reservedDates: [String]

        init(_ dates: [String]) {
            self.reservedDates = dates
        }
    }
}


extension CalendarView {
    enum CalendarMode {
        case basicCalendarMode
    }
}

extension CalendarView.Coordinator: FSCalendarDataSource {

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Sugeee")
    }
}

extension CalendarView.Coordinator: FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }
        let eventDate = dateFormatter.string(from: date)

        return reservedDates.contains(where: { $0 == eventDate }) ? UIColor(named: "Primary") : nil
    }


    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter
        }
        let eventDate = dateFormatter.string(from: date)

        return reservedDates.contains(where: { $0 == eventDate }) ? .white: .black
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return UIColor.white
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        return .black
    }
}
