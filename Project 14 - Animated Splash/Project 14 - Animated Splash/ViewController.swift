//
//  ViewController.swift
//  Project 14 - Animated Splash
//
//  Created by Ryan on 2020/1/9.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let frame = UIScreen.main.bounds

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: frame)
        let image = #imageLiteral(resourceName: "screen")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var mask: CALayer = {
        let layer = CALayer()
        layer.contents = UIImage(named: "twitter")?.cgImage
        layer.contentsGravity = .resizeAspect
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        layer.position = CGPoint(x: self.imageView.frame.size.width/2, y: self.imageView.frame.height/2)
        return layer
    }()
    
    func setupView() {
        self.view.addSubview(imageView)
        imageView.setNeedsLayout()
        imageView.layoutIfNeeded()
        imageView.layer.mask = self.mask
        animateMask()
    }

    func animateMask() {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.5
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        do {
            // 动画需要加上这段代码，否则会造成页面闪一下
            keyFrameAnimation.fillMode = CAMediaTimingFillMode.forwards
            keyFrameAnimation.isRemovedOnCompletion = false
        }
        let initalBounds = NSValue(cgRect: self.mask.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90*0.9, height: 73*0.9))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.mask.add(keyFrameAnimation, forKey: "bounds")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.imageView.layer.mask = nil
    }
}
