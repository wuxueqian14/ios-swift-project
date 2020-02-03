//
//  PresentAnimationController.swift
//  Project 16 - Tumblr Menu
//
//  Created by Ryan on 2020/2/3.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class PresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let _ = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) as? MenuViewController else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        let duration = transitionDuration(using: transitionContext)
        
        let topOffset = CGFloat(600)
        let middleOffset = CGFloat(400)
        let bottomOffset = CGFloat(200)
        
        toVC.textButton.transform = setScaleX(-topOffset)
        toVC.textLabel.transform = setScaleX(-topOffset)
        toVC.quoteButton.transform = setScaleX(-middleOffset)
        toVC.quoteLabel.transform = setScaleX(-middleOffset)
        toVC.chatButton.transform = setScaleX(-bottomOffset)
        toVC.chatLabel.transform = setScaleX(-bottomOffset)
        toVC.photoButton.transform = setScaleX(topOffset)
        toVC.photoLabel.transform = setScaleX(topOffset)
        toVC.linkButton.transform = setScaleX(middleOffset)
        toVC.linkLabel.transform = setScaleX(middleOffset)
        toVC.audioButton.transform = setScaleX(bottomOffset)
        toVC.audioLabel.transform = setScaleX(bottomOffset)
        toVC.dismissButton.transform = CGAffineTransform(translationX: 0, y: 600)
        
        UIView.animate(withDuration: duration, animations: {
        
            toVC.textButton.transform = .identity
            toVC.textLabel.transform = .identity
            toVC.quoteButton.transform = .identity
            toVC.quoteLabel.transform = .identity
            toVC.chatButton.transform = .identity
            toVC.chatLabel.transform = .identity
            toVC.photoButton.transform = .identity
            toVC.photoLabel.transform = .identity
            toVC.linkButton.transform = .identity
            toVC.linkLabel.transform = .identity
            toVC.audioButton.transform = .identity
            toVC.audioLabel.transform = .identity
            toVC.dismissButton.transform = .identity
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    private func setScaleX(_ x: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: x, y: 0)
    }
}
