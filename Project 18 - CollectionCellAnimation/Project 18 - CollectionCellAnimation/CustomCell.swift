//
//  CustomCell.swift
//  Project 18 - CollectionCellAnimation
//
//  Created by Ryan on 2020/2/7.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

import UIKit

class CustomCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth - 60, height: 400))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(imageView)
        //backgroundColor = UIColor(red: 240 / 255, green: 248 / 255, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 2, height: 2)
        
    }
}

