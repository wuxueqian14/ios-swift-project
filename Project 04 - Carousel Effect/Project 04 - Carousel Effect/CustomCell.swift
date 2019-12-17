//
//  CustomCell.swift
//  Project 04 - Carousel Effect
//
//  Created by 吴学谦 on 2019/12/17.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 300, height: 400))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var effectView : UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x: 20, y: 400, width: 300, height: 60)
        return effectView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 400, width: 300, height: 60))
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    var info: CellInfo! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        imageView.image = info.image
        label.text = info.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(imageView)
        contentView.addSubview(effectView)
        contentView.addSubview(label)
    }
}
