//
//  SoundView.swift
//  Release
//
//  Created by mora hakim on 20/07/23.
//

import SwiftUI

struct SoundBarView: View {
    @ObservedObject var soundBarViewModel = SoundBarViewModel()
    var animation: Animation {
        return .linear(duration: 0.5).repeatForever()
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                soundBarViewModel.bar(low: 0.4)
                    .animation(animation.speed(1.5), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.3)
                    .animation(animation.speed(1.2), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.5)
                    .animation(animation.speed(1.0), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.3)
                    .animation(animation.speed(1.7), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.5)
                    .animation(animation.speed(1.0), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.5)
                    .animation(animation.speed(1.0), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.5)
                    .animation(animation.speed(1.0), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.3)
                    .animation(animation.speed(1.5), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.4)
                    .animation(animation.speed(1.2), value: soundBarViewModel.drawingHeight)
                soundBarViewModel.bar(low: 0.5)
                    .animation(animation.speed(1.5), value: soundBarViewModel.drawingHeight)
            }
            .frame(width: 120)
            .onAppear {
                soundBarViewModel.drawingHeight.toggle()
            }
        }
    }
}
