//
//  AnimationRelease.swift
//  Release!
//
//  Created by mora hakim on 20/08/23.
//

import SwiftUI

struct AnimationRelease: View {
    @State private var isAnimating = false
    var body: some View {
        withAnimation(.easeInOut) {
            ZStack {
                Circle()
                    .fill(Color("Primary").opacity(0.5))
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimating ? 1.5 : 1.0)
                Circle()
                    .fill(Color("Primary"))
                    .frame(width: 70, height: 70)
                    .scaleEffect(isAnimating ? 1.3 : 1.0)
            }
        }
    }
}
