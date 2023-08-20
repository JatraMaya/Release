//
//  DashboardViewModel.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var tabViewIndex = 0
    @Published var animate: Bool = false
    func rotateSubtitle() {
        if tabViewIndex == 3 {
            tabViewIndex = 0
        } else {
            tabViewIndex += 1
        }
    }
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(.easeInOut(duration: 0.30)) {
                self.animate = true
            }
        }
    }
}
