//
//  PopAnimationController.swift
//  Project 18 - CollectionCellAnimation
//
//  Created by Ryan on 2020/2/7.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class PopAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? DetailViewController,
            let toVC = transitionContext.viewController(forKey: .to) as? ViewController,
            let selectedCell = toVC.selectedCell else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.insertSubview(toVC.view, at: 0)
        let frame = selectedCell.convert(selectedCell.imageView.frame, to: toVC.view)
        
        let duration = transitionDuration(using: transitionContext)
        toVC.view.isHidden = true
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations:
            {
                fromVC.view.frame = frame
                fromVC.view.layer.cornerRadius = 15
                fromVC.view.layer.masksToBounds = true
                fromVC.topImageView.frame.size.width = ScreenWidth - 60
                fromVC.topImageView.frame.size.height = 400
                fromVC.closeBtn.alpha = 0
        }) { (_) in
            toVC.view.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
