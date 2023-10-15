//
//  ViewController.swift
//  ARKit+RealityKitDemo
//
//  Created by Itsuki on 2023/10/14.
//

import UIKit
import ARKit
import RealityKit

class ViewController: UIViewController  {

    @IBOutlet weak var arView: ARView!
    
    let greenCube = MyCube(color: .green, size: 0.3)
    let redCube = MyCube(color: .red, size: 0.3)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arView.environment.background = .color(.white)

        
//        arView.installGestures(.all, for: greenCube)
        arView.scene.addAnchor(greenCube)
    }

    
    @IBAction func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        let position = sender.location(in: arView)
//        print(arView.entity(at: position))
        if let hitEntity = arView.entity(at: position) {
            
            var newTransform = hitEntity.transform
            newTransform.scale = .init(
                repeating: newTransform.scale.x * 0.9
                )
            hitEntity.transform = newTransform
            return
        }
        
        let results = arView.hitTest(position, types: .featurePoint)
        if !results.isEmpty {
            guard let position3D = results.first?.worldTransform else {return}
            redCube.anchoring = AnchoringComponent(RealityKit.AnchoringComponent.Target.world(transform: position3D))
            arView.scene.addAnchor(redCube)
        }
        
    }

}

