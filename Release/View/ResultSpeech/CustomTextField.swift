//
//  CustomTextField.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import SwiftUI

struct CenteredTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.center)
            .frame(width: 100, height: 10)
            .padding(.horizontal)
    }
}

struct MultilineTextField: UIViewRepresentable {
    @Binding var content: String
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = content
    }
}
