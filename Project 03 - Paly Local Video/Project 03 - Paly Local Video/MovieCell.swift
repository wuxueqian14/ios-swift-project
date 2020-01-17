//
//  MovieCell.swift
//  Project 03 - Paly Local Video
//
//  Created by 吴学谦 on 2019/12/16.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let source: String
}

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(backImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(sourceLabel)
        self.contentView.addSubview(button)
    }
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 220))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 4, y: 170, width: ScreenWidth / 2, height: 20))
        label.font = UIFont(name: "Avenir Next Heavy", size: 14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var sourceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 4, y: 190, width: ScreenWidth / 2, height: 20))
        label.font = UIFont(name: "Avenir Next Regular", size: 8)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
        
    lazy var button: UIButton = {
            let button = UIButton(frame: CGRect(x: ScreenWidth / 4, y: 57, width: ScreenWidth / 2, height: 100))
            button.setImage(UIImage(named: "playBtn"), for: .normal)
        return button
    }()
}
