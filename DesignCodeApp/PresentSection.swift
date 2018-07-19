//
//  PresentSection.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/17/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class PresentSection: NSObject, UIViewControllerAnimatedTransitioning {
    
    var cellFrame: CGRect!
    var cellTransform: CATransform3D!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 10
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let destination = transitionContext.viewController(forKey: .to) as! SectionViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(destination.view)
        
        // Initial State
        
        // Constraints
        let widthCondtraints = destination.scrollView.widthAnchor.constraint(equalToConstant: 304)
        let heightContraints = destination.scrollView.heightAnchor.constraint(equalToConstant: 248)
        let bottomContraints = destination.scrollView.bottomAnchor.constraint(equalTo: destination.coverView.bottomAnchor)
        
        NSLayoutConstraint.activate([widthCondtraints, heightContraints, bottomContraints])
        
        // Transform
        let translate = CATransform3DMakeTranslation(cellFrame.origin.x, cellFrame.origin.y, 0.0)
        let transform = CATransform3DConcat(translate, cellTransform)
        
        destination.view.layer.transform = transform
        destination.view.layer.zPosition = 999
        containerView.layoutIfNeeded()
        
        // Adding corner radius to scroll view
        
        destination.scrollView.layer.cornerRadius = 14
        destination.scrollView.layer.shadowOpacity = 0.25
        destination.scrollView.layer.shadowOffset.height = 10
        destination.scrollView.layer.shadowRadius = 20
        
        // positioniong the close button and subhead visual effect to the top
        
        let moveUpTransform = CGAffineTransform(translationX: 0, y: -100)
        let scaleUpTransform = CGAffineTransform(scaleX: 2, y: 2)
        let removeFromView = moveUpTransform.concatenating(scaleUpTransform)
        
        // for close button
        destination.closeVisualEffectView.transform = removeFromView
        destination.closeVisualEffectView.alpha = 0
        
        // for subhead
        destination.subHeadVisualEffectView.transform = removeFromView
        destination.subHeadVisualEffectView.alpha = 0
        
        
        
        
        let animator = UIViewPropertyAnimator(duration: 10, dampingRatio: 0.7) {
            
            // Final State
            NSLayoutConstraint.deactivate([widthCondtraints, heightContraints, bottomContraints])
            destination.view.layer.transform = CATransform3DIdentity
            
            // Removing corner radius
            destination.scrollView.layer.cornerRadius = 0
            
            destination.closeVisualEffectView.transform = .identity
            destination.closeVisualEffectView.alpha = 1
            
            destination.subHeadVisualEffectView.transform = .identity
            destination.subHeadVisualEffectView.alpha = 1
            
            // Final state for title
            
            let scaleTitleTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            let moveTitleTransform = CGAffineTransform(translationX: 30, y: 10)
            let titleTransform = scaleTitleTransform.concatenating(moveTitleTransform)
            destination.sectionTitleLable.transform = titleTransform
            
            
            containerView.layoutIfNeeded()
            
            
        }
        animator.addCompletion { (finished) in
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
    
    
    
    

}
