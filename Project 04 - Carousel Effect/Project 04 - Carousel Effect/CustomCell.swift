//
//  ModelCollectionViewCell.swift
//  Project 04 - Carousel Effect
//
//  Created by Ryan on 2020/1/18.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 20, y: 10, width: 350, height: 350))
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 360, width: 350, height: 40))
        label.layer.cornerRadius = 10
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x: 20, y: 360, width: 350, height: 40)
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 5
        return effectView
    }()
    
    var info: Model! {
        didSet {
            update()
        }
    }
    
    fileprivate func update() {
        imageView.image = info.image
        infoLabel.text = info.info
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.contentView.layer.cornerRadius = 10
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(effectView)
        self.contentView.addSubview(infoLabel)
    }
}
