//
//  SoundBarViewModel.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import SwiftUI

class SoundBarViewModel: ObservableObject {
    @Published var drawingHeight = true
    func bar(low: CGFloat = 0.0, high: CGFloat = 1.0) -> some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(.indigo.gradient)
            .frame(height: (drawingHeight ? high : low) * 64)
            .frame(height: 64, alignment: .bottom)
    }
}
