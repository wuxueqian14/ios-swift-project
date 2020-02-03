//
//  CustomCell.swift
//  Project 16 - Tumblr Menu
//
//  Created by Ryan on 2020/2/4.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var leftTopImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 60, height: 60))
        //imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 90, y: 0, width: 150, height: 60))
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 70, width: ScreenWidth, height: 200))
        //imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(leftTopImageView)
        addSubview(nameLabel)
        addSubview(backImageView)
        selectionStyle = .none
        backgroundColor = .clear
    }
}
