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
        NavigationStack{
        ZStack{
            if isSplashNotActive{

                if isOnboarding{
                    DashboardView()
//                    ARViewContainer().edgesIgnoringSafeArea(.all)

                }else {
                    MainOnboardingView()
                }

            }else {
                SplashScreenView()
            }

        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.55){
                withAnimation{
                    self.isSplashNotActive = true
                }
            }
        }}.accentColor(.black)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @State private var tapLocation: CGPoint? = nil
//    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        
//        let arView = ARView(frame: .zero)
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = [.horizontal, .vertical]
//        config.environmentTexturing = .automatic
//
//        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
//            config.sceneReconstruction = .mesh
//        }
//        arView.session.run(config)
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Shark.load_Shark()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
                arView.addGestureRecognizer(tapGesture)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
//        if let model = self.modelConfirmedForPlacement {
//            if let modelEntity = model.modelEntity {
//                print("DEBUG: adding model to scene - \(model.modelName)")
//                
//                // Specify the plane type for the anchorEntity (horizontal or vertical)
//                let anchorEntity = AnchorEntity(plane: .any)
//                anchorEntity.addChild(modelEntity)
//                uiView.scene.addAnchor(anchorEntity)
//                
//            } else {
//                print("DEBUG: unable to load modelEntity for \(model.modelName)")
//            }
//          
//        }
        
        if let tapLocation = tapLocation {
                    // Update the frame/kotak position if tapLocation is available
                    // Implement your code to display the frame/kotak at the tapped location
                    // You can use the tapLocation CGPoint to position your frame/kotak
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
               // Handle tap location here
               // Implement your code to place objects or perform actions when tapped
           }
       }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
