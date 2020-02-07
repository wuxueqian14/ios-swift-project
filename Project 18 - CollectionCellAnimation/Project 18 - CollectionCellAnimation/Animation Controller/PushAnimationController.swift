//
//  PushAnimationController.swift
//  Project 18 - CollectionCellAnimation
//
//  Created by Ryan on 2020/2/7.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class PushAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let selectedCell = fromVC.selectedCell else {
                return
        }
        
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        let frame = selectedCell.convert(selectedCell.imageView.frame, to: fromVC.view)
        toVC.view.frame = frame
        toVC.view.layer.cornerRadius = 15
        toVC.view.layer.masksToBounds = true
        toVC.topImageView.frame.size.width = ScreenWidth - 60
        toVC.topImageView.frame.size.height = 400
        
        containerView.addSubview(toVC.view)
        
        let duration = transitionDuration(using: transitionContext)
        
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations:
            {
                toVC.view.frame = finalFrame
                toVC.topImageView.frame.size.width = ScreenWidth
                toVC.topImageView.frame.size.height = ScreenHeight * 0.55
                toVC.closeBtn.alpha = 1
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    

}

