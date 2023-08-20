//
//  TextFieldCustomStyle.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 22/07/23.
//

import SwiftUI

struct TextFieldCustomStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Primary"), lineWidth: 2)
            )
            .cornerRadius(20)
    }
}
