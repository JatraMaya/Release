//
//  FSCalenddarView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 25/07/23.
//

import SwiftUI
import FSCalendar

class CalendarModule: UIViewController, FSCalendarDelegate {

    var calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initCalendar()
        view.addSubview(calendar)
    }

    private func initCalendar() {
        calendar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 150)
        calendar.appearance.todayColor = UIColor.systemGreen
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20)
        calendar.appearance.titlePlaceholderColor = UIColor.white
        calendar.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesUpperCase
        calendar.pagingEnabled = false
        calendar.scrollDirection = .horizontal
    }
}

struct CalendarModuleViewController: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarModuleViewController>) -> UIViewController {
        let viewController = CalendarModule()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CalendarModuleViewController>) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    final class Coordinator: NSObject, FSCalendarDelegate {
        private var parent: CalendarModuleViewController


        init (_ parent: CalendarModuleViewController) {
            self.parent = parent
        }

    }
}
