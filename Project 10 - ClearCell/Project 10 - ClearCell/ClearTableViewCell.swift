//
//  ClearTableViewCell.swift
//  Project 10 - ClearCell
//
//  Created by Ryan on 2019/12/28.
//  Copyright © 2019 Ryan. All rights reserved.
//

import UIKit

class ClearTableViewCell: UITableViewCell {

    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        let color2 = UIColor(white: 0.75, alpha: 0.1).cgColor
        let color3 = UIColor(white: 0.5, alpha: 0.15).cgColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.0, 1.0, 1.0]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
