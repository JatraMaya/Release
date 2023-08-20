//
//  SpeakView.swift
//  Release
//
//  Created by mora hakim on 19/07/23.
//

import SwiftUI
import RealityKit
import ARKit
import EventKit

struct SpeakView: View {
    @State private var isPlacementEnabled = false
    @State private var isRecording: Bool = false
    @State private var showTranscript: Bool = false
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ARViewContainer().ignoresSafeArea(.all)
                PickerView()
            }
        }.navigationBackButton(color: .white)
    }
}

struct NavigationBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?
    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))
                        Text("Back")
                            .foregroundColor(Color(color))
                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}
extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}
