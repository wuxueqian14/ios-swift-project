//
//  DismissAnimationController.swift
//  Project 16 - Tumblr Menu
//
//  Created by Ryan on 2020/2/3.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class DismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? MenuViewController,
            let _ = transitionContext.viewController(forKey: .to)  else {
                return
        }
        
        let duration = transitionDuration(using: transitionContext)
        
        let topOffset = CGFloat(600)
        let middleOffset = CGFloat(400)
        let bottomOffset = CGFloat(200)
        
        UIView.animate(withDuration: duration, animations: {
            fromVC.textButton.transform = self.setScaleX(-topOffset)
            fromVC.textLabel.transform = self.setScaleX(-topOffset)
            fromVC.quoteButton.transform = self.setScaleX(-middleOffset)
            fromVC.quoteLabel.transform = self.setScaleX(-middleOffset)
            fromVC.chatButton.transform = self.setScaleX(-bottomOffset)
            fromVC.chatLabel.transform = self.setScaleX(-bottomOffset)
            fromVC.photoButton.transform = self.setScaleX(topOffset)
            fromVC.photoLabel.transform = self.setScaleX(topOffset)
            fromVC.linkButton.transform = self.setScaleX(middleOffset)
            fromVC.linkLabel.transform = self.setScaleX(middleOffset)
            fromVC.audioButton.transform = self.setScaleX(bottomOffset)
            fromVC.audioLabel.transform = self.setScaleX(bottomOffset)
            fromVC.dismissButton.transform = CGAffineTransform(translationX: 0, y: 600)
            
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    private func setScaleX(_ x: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: x, y: 0)
    }
}
