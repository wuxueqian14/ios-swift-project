//
//  CellInfo.swift
//  Project 04 - Carousel Effect
//
//  Created by 吴学谦 on 2019/12/17.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

class CellInfo {
    var title = ""
    var image: UIImage!
    
    init(title: String, image: UIImage!) {
        self.title = title
        self.image = image
    }
    
    static func createInfos() -> [CellInfo] {
        return [
            CellInfo(title: "Hello there, i miss u.", image: UIImage(named: "hello")!),
            CellInfo(title: "🐳🐳🐳🐳🐳", image: UIImage(named: "dudu")),
            CellInfo(title: "Training like this, #bodyline", image: UIImage(named: "bodyline")),
            CellInfo(title: "I'm hungry, indeed.", image: UIImage(named: "wave")),
            CellInfo(title: "Dark Varder, #emoji", image: UIImage(named: "darkvarder")),
            CellInfo(title: "I have no idea, oh", image: UIImage(named: "hhhhh"))
        ]
    }
}
