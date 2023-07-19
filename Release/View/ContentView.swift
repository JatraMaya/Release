//
//  ContentView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @State var isSplashNotActive: Bool = false

    var body: some View {
        ZStack{
            if isSplashNotActive{
                if isOnboarding{
                    ARViewContainer().edgesIgnoringSafeArea(.all)
                }else {
                    MainOnboardingView()
                }

            }else {
                SplashScreenView()
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    self.isSplashNotActive = true
                }
            }
            }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
