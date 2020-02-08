//
//  CustomCell.swift
//  Project 19 - SwipeableCell
//
//  Created by Ryan on 2020/2/8.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

struct Pattern {
    let image: String
    let name: String
}


class CustomCell: UITableViewCell {

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
        addSubview(leftImageView)
        addSubview(rightLabel)
    }
    
    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth * 0.45, height: 60))
        return imageView
    }()

    lazy var rightLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth * 0.45, y: 0, width: ScreenWidth * 0.55, height: 60))
        return label
    }()
}
