//
//  Model.swift
//  teProject 04 - Carousel Effectst
//
//  Created by Ryan on 2020/1/18.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class Model {
    var info: String!
    var image: UIImage!
    
    init(info: String, image: UIImage!) {
        self.info = info
        self.image = image
    }
    
    static func creatModelArray() -> [Model] {
        return [
            Model(info: "Hello there, i miss u.", image: UIImage(named: "hello")!),
            Model(info: "🐳🐳🐳🐳🐳", image: UIImage(named: "dudu")),
            Model(info: "Training like this, #bodyline", image: UIImage(named: "bodyline")),
            Model(info: "I'm hungry, indeed.", image: UIImage(named: "wave")),
            Model(info: "Dark Varder, #emoji", image: UIImage(named: "darkvarder")),
            Model(info: "I have no idea, oh", image: UIImage(named: "hhhhh"))
        ]
    }
}
