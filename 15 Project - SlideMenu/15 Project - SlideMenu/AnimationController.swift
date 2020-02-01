//
//  AnimationController.swift
//  15 Project - SlideMenu
//
//  Created by Ryan on 2020/1/31.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

@objc protocol AnimationDelegate {
    func dismiss()
}

enum TransitionType {
    case Presented, Dismissed
}

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var delegate: AnimationDelegate?
    
    private var type: TransitionType = .Dismissed
    
    var snapshot: UIView!
    
    override init() {
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        
        if type == .Presented {
            snapshot = fromVC.view.snapshotView(afterScreenUpdates: true)
            containerView.addSubview(toVC.view)
            containerView.addSubview(snapshot)
            toVC.view.frame = CGRect(x: 0, y: -400, width: ScreenWidth, height: ScreenHeight)
            let tapGesture = UITapGestureRecognizer(target: delegate, action: #selector(AnimationDelegate.dismiss))
            snapshot.addGestureRecognizer(tapGesture)
            UIView.animate(withDuration: duration, animations: {
                self.snapshot.frame = CGRect(x: 0, y: 400, width: ScreenWidth, height: ScreenHeight)
                toVC.view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 400)
            }) { (_) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            UIView.animate(withDuration: duration, animations: {
                //fromVC.view.frame = CGRect(x: 0, y: -400, width: ScreenWidth, height: ScreenHeight)
                self.snapshot.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
            }) { (_) in
                if self.type == .Dismissed {
                    self.snapshot.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
        
        
    }
}


extension AnimationController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        type = .Presented
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        type = .Dismissed
        return self
    }
}
