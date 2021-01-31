//
//  ViewController.swift
//  Ignite
//
//  Created by Brandon on 2021-01-30.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        // sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Position
        let sunPosition = SCNVector3(0, 0, -3)
        let earthPosition = SCNVector3(2, 0, -3)
        let moonPosition = SCNVector3(2.5, 0, -3)
        
        // Size/Radius
        let sunRadius = CGFloat(0.4)
        let earthRadius = CGFloat(0.2)
        let moonRadius = CGFloat(0.1)
        
        // Planets's texture path
        let sunMaterialPath = "art.scnassets/sun.jpg"
        let earthMaterialPath =  "art.scnassets/earth.jpg"
        let moonMaterialPath = "art.scnassets/moon.jpg"
        
        // Create planets's nodes
        let sun = createPlanet(at: sunPosition, rad: sunRadius, materialPath: sunMaterialPath)
        let earth = createPlanet(at: earthPosition, rad: earthRadius, materialPath: earthMaterialPath)
        let moon = createPlanet(at: moonPosition, rad: moonRadius, materialPath: moonMaterialPath)
        
        scene.rootNode.addChildNode(sun)
        scene.rootNode.addChildNode(earth)
        scene.rootNode.addChildNode(moon)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    func createPlanet(at position: SCNVector3, rad: CGFloat, materialPath: String) -> SCNNode {
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: materialPath)
        
        let sphere = SCNSphere(radius: rad)
        sphere.firstMaterial = material
        
        let node = SCNNode(geometry: sphere)
        node.position = position
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
}
