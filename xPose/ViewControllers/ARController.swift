//
//  ARController.swift
//  xPose
//
//  Created by Xavier Welscher on 02.01.22.
//

import UIKit
import ARKit
import RealityKit
import SceneKit

class ARController: UIViewController, ARSessionDelegate {
    @IBOutlet var sceneView: ARSCNView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            sceneView.session.delegate = self
            sceneView.scene = SCNScene()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            guard ARBodyTrackingConfiguration.isSupported else {
                fatalError("A device with A12 chip is required")
            }

            let configuration = ARBodyTrackingConfiguration()
            //configuration.planeDetection = .horizontal
            
            // test features
            configuration.planeDetection = [.horizontal, .vertical]
            configuration.automaticSkeletonScaleEstimationEnabled = true
            configuration.isAutoFocusEnabled = true
            
            
            sceneView.session.run(configuration)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            sceneView.session.pause()
        }
        
        func session(_ session: ARSession, didFailWithError error: Error) {
            // If failed (e.g. presenting error message)
        }
        
        func sessionWasInterrupted(_ session: ARSession) {
            // session interrupted
        }
        
        func sessionInterruptionEnded(_ session: ARSession) {
            // session not interrupted anymore
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let bodyAnchor = anchor as? ARBodyAnchor else {
                    return
                }
                setARBodyAnchor(anchor: bodyAnchor)
            }
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let bodyAnchor = anchor as? ARBodyAnchor else {
                    return
                }
                setARBodyAnchor(anchor: bodyAnchor)
            }
        }
        
        
        func setARBodyAnchor(anchor: ARBodyAnchor) {
            
            let skeleton = anchor.skeleton
            
            for jointName in skeleton.definition.jointNames {
                let jointType = ARSkeleton.JointName(rawValue: jointName)
                
                if let transform = skeleton.modelTransform(for: jointType) {
                    
                    let partsPoint = SCNMatrix4(transform)
                    let hipPoint = SCNMatrix4(anchor.transform)
                    let matrix = SCNMatrix4Mult(partsPoint, hipPoint)
                    let position = SCNVector3(matrix.m41, matrix.m42, matrix.m43)
                    
                    if let nodeToUpdate = sceneView.scene.rootNode.childNode(withName: jointName, recursively: false) {
                        nodeToUpdate.isHidden = false
                        nodeToUpdate.position = position
                    } else {
                        
                        // create asset
                        let sphereGeometry = SCNSphere(radius: 0.02)
                        sphereGeometry.isGeodesic = true
                        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.green
                        
                        //
                        let sphereNode = SCNNode(geometry: sphereGeometry)
                        sphereNode.position = position
                        sphereNode.name = jointName
                        sceneView.scene.rootNode.addChildNode(sphereNode)
                    }
                } else {
                    //
                    if let nodeToHide = sceneView.scene.rootNode.childNode(withName: jointName, recursively: false) {
                        nodeToHide.isHidden = true
                    }
                }
            }
        }
    
}
