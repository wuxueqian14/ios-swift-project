//
//  ViewController.swift
//  Project 08 - ImageScroller
//
//  Created by Ryan on 2019/12/20.
//  Copyright © 2019 Ryan. All rights reserved.
//

import UIKit

let frame = UIScreen.main.bounds

class ViewController: UIViewController {

    func setupView() {
        self.view.backgroundColor = .white
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        self.view.addSubview(backImageView)
        self.view.addSubview(effectView)
        self.view.addSubview(scrollView)
    }
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "steve")
        return imageView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: frame.width / 2 - 160, y: frame.height / 2 - 160, width: 320, height: 320))
        imageView.image = UIImage(named: "steve")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = frame
        return effectView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: frame)
        scrollView.contentSize = self.imageView.bounds.size
        scrollView.addSubview(self.imageView)
        scrollView.delegate = self
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
