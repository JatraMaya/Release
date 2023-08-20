//
//  PickerView.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import SwiftUI

struct PickerView: View {
    @State private var isButtonVisible = true
    var body: some View {
        if isButtonVisible {
            ZStack {
                FirstContent()
                    .padding(.bottom, 605)
                Button {
                    print("DEBUG: selected model with name:")
                    isButtonVisible = false
                } label: {
                    Image("Frame")
                        .resizable()
                        .frame(width: 100, height: 100.5)
                        .foregroundColor(Color.gray)
                        .aspectRatio(1/1, contentMode: .fit)
                        .cornerRadius(12)
                }
            }
            .frame(maxHeight: .infinity)
        } else {
            PlacementBodyAR()
        }
    }
}
