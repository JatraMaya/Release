//
//  ContentView.swift
//  Release
//
//  Created by Ahmad Fadly Iksan on 19/07/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @State var isSplashNotActive: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                if isSplashNotActive {
                    if isOnboarding {
                        DashboardView()
                    } else {
                        MainOnboardingView()
                    }
                } else {
                    SplashScreenView()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.50) {
                    withAnimation {
                        self.isSplashNotActive = true
                    }
                }
            }}.accentColor(.black)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @State private var tapLocation: CGPoint?
    @State private var isARVisible = false
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let boxAnchor = try? Mora.loadBox()
        arView.scene.anchors.append(boxAnchor!)
        if !isARVisible {
            let tapGesture = UITapGestureRecognizer(target: context.coordinator,
                                                    action: #selector(context.coordinator.handleTap(_:)))
            arView.addGestureRecognizer(tapGesture)
        }
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {
        if let tapLocation = tapLocation, !isARVisible {
            let sphere = MeshResource.generateSphere(radius: 0.1)
            let material = SimpleMaterial(color: .red, isMetallic: true)
            let sphereEntity = ModelEntity(mesh: sphere, materials: [material])
            let anchorEntity = AnchorEntity(world: SIMD3<Float>(Float(tapLocation.x), Float(tapLocation.y), 0))
            anchorEntity.addChild(sphereEntity)
            uiView.scene.addAnchor(anchorEntity)
            self.tapLocation = nil
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject {
        var parent: ARViewContainer
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            let location = gesture.location(in: gesture.view)
            parent.tapLocation = location
            parent.isARVisible = true
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
