//
//  InteractivePanToClose.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/22/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class InteractivePanToClose: UIPercentDrivenInteractiveTransition {

  
    @IBOutlet weak var viewController: UIViewController!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var gestureRecognizer: UIPanGestureRecognizer!
    
    
    func setRecognizer() {
        
        gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handle))
        scrollView.addGestureRecognizer(gestureRecognizer)
        
        gestureRecognizer.delegate = self
        
    }
    
    
    
    
    @objc func handle(_ gesture: UIPanGestureRecognizer) {
        guard scrollView.contentOffset.y < 1 else {
            return
        }
        let threshold: CGFloat = 100
        let translation = gesture.translation(in: viewController.view)
        // we took the point of the gesture
        
        switch gesture.state {
        case .changed:
            let percentComplete = translation.y/2000
//            print("\(translation.y)")
//            print("percent complete\(percentComplete)")
            update(percentComplete)
            // the animation will update
        case.ended:
            // the animation will end
            if translation.y > threshold {
                finish()
            }else {
                cancel()
            }
              default: break
        }
      
        
    }
    
    
    
    // Mark: - overrides functions
    
    
    // Mark: - Update
    
    override func update(_ percentComplete: CGFloat) {
        visualEffectView.alpha = 1-percentComplete
        let translation = gestureRecognizer.translation(in: viewController.view) // taking the points of the gesture
        let translationY = CGAffineTransform(translationX: 0, y: translation.y) // translation for Y
        let scale = CGAffineTransform(scaleX: 1-percentComplete, y: 1-percentComplete) // scale using passed percent complete
        
        // Rotation setup
        
        let origin = gestureRecognizer.location(in: viewController.view) // origin X for the gesture (touch)
        let frameWidth = viewController.view.frame.width // = 375
        let originX = origin.x/frameWidth
        print("frameWidth\(frameWidth) originX \(origin.x)")
        let degrees = 150 - originX * 300
        let rotationAngle = percentComplete * degrees * CGFloat.pi / 180
        let rotation = CGAffineTransform(rotationAngle: rotationAngle)
        let transform = translationY.concatenating(scale).concatenating(rotation)
        dialogView.transform = transform
        
        // the view should also rotate by a factore of the screen which is the frame  and the translation of finger which the percent complete
        
        // composed of translation the dialog with finger, scale down and rotation to each side
        
    }
    
    // Mark: - Cancel
    
    override func cancel() {
        
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.6) {
            
            self.visualEffectView.alpha = 1
            self.dialogView.transform = .identity
            
        }
        animator.startAnimation()

    }
    
      // Mark: - Finish
    
    override func finish() {
        
        let animator = UIViewPropertyAnimator(duration: 0.9, dampingRatio: 0.9) {
            self.dialogView.frame.origin.y += 200
            self.visualEffectView.effect = nil
            self.viewController.dismiss(animated: true, completion: nil)
        }
        animator.startAnimation()
    }
    
    
    
    
    
}

extension InteractivePanToClose: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
