//
//  ViewController.swift
//  Project 16 - Tumblr Menu
//
//  Created by Ryan on 2020/2/3.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: Frame)
        let image = #imageLiteral(resourceName: "background")
        imageView.image = image
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 40, y: ScreenHeight - 80, width: 80, height: 80))
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapButton() {
        let toVC = MenuViewController()
        toVC.modalPresentationStyle = .custom
        toVC.transitioningDelegate = self
        present(toVC, animated: true, completion: nil)
    }
    
    func setupView() {
        view.addSubview(backImageView)
        view.addSubview(button)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let _ = presenting as? ViewController, let _ = presented as? MenuViewController else {
            return nil
        }
        return PresentAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let _ = dismissed as? MenuViewController else {
            return nil
        }
        return DismissAnimationController()
    }
}
