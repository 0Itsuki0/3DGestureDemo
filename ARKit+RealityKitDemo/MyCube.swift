//
//  MyCube.swift
//  ARKit+RealityKitDemo
//
//  Created by Itsuki on 2023/10/14.
//

import UIKit
import RealityKit


class MyCube: Entity, HasModel, HasAnchoring, HasCollision {
    
    required init(color: UIColor, size: Float) {
        super.init()
        self.model = ModelComponent(
            mesh: .generateBox(size: size, cornerRadius: 0.1),
            materials: [SimpleMaterial(color: color, roughness: 0.15, isMetallic: true)]
        )
//        self.collision = CollisionComponent(shapes: [.generateBox(width: size, height: size, depth: size)])
        self.generateCollisionShapes(recursive: true)
        
  }
    
    @MainActor required init() {
        fatalError("init() has not been implemented")
    }
}
