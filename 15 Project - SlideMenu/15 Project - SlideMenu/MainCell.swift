//
//  MainCell.swift
//  15 Project - SlideMenu
//
//  Created by Ryan on 2020/1/24.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 240))
        return imageView
    }()
    
    lazy var authorImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 25, y: 180, width: 40, height: 40))
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 75, y: 180, width: 280, height: 20))
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 75, y: 202, width: 280, height: 20))
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(backImageView)
        self.addSubview(authorLabel)
        self.addSubview(authorImageView)
        self.addSubview(titleLabel)
    }
}
