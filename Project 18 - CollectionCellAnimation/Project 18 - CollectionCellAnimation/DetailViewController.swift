//
//  DetailViewController.swift
//  Project 18 - CollectionCellAnimation
//
//  Created by Ryan on 2020/2/7.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        topImageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(topImageView)
        view.addSubview(closeBtn)
        view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    
    lazy var topImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight * 0.55))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: ScreenHeight * 0.6, width: ScreenWidth - 40, height: ScreenHeight * 0.35))
        label.text = """
        Just after Lauren Goodwin moved to Los Angeles, she immediately realized the deep relationship between the city, the community here and Kobe.

        A few weeks ago, Goodwin visited West Hollywood after moving to Los Angeles, where she saw the famous "Mamba on Melrose" (Melrose Mamba mural), and Kobe Bryant came to her mind.

        Like Kobe, Goodwin grew up in Philadelphia and now relocates to Los Angeles. Goodwin has always been an avid fan of Kobe, and will pay attention to Kobe's games and his career. Goodwin was very satisfied in Los Angeles. Kobe culture can be seen in the streets and alleys. Los Angeles can be called the home of Kobe fans.

        Last Sunday, Goodwin came to the Kobe Bryant's mural in West Hollywood again. Looking at Bryant, Goodwin's tears could not stop, she kept wiping with a paper towel in her hands, and her sunglasses couldn't stop. Sadness in the eyes. A few hours ago Goodwin learned that Kobe and 13-year-old daughter Gigi and 7 others died in a helicopter accident near Calabas. Sad Goodwin randomly went out to relax, but she came to Kobe unconsciously. Before the comic.

        "I kept sobbing on my way," Goodwin said in a hoarse to harsh voice. "My parents, grandparents, and all my friends in Philadelphia, including me, called me and they knew that Kobe's death was to me Is devastating. "

        As Kobe's iron powder, Goodwin has never seen him.

        Los Angeles and countless fans living around the world have never really seen Kobe.

        But everyone was grieved.

        Some people may be wondering why Kobe's death has hit fans so much, and maybe you are wondering why you are so sad.

        In fact, all this is normal.

        "In our society, sadness seems to be fake," said Freda Wasserman, special program director at the Los Angeles Family Grief Assistance Center. "People will be surprised by many phenomena of excessive sadness, especially after the death of a celebrity , Many of us will have sad reactions that are surprising to us, which contain too many complex emotions. Specific to Kobe's death, there are more reasons for people to be sad. "

        Not everyone in the world is saddened by Kobe's death, because in the Eagle County incident in 2003, many people in the sexually assaulted group had complicated and inexplicable feelings about Kobe.

        Some fans believe that Kobe is more than just a world-class basketball icon. He is also the father of four daughters, a husband, and a 41-year-old man who is about to start the second chapter of his life. His future is bright.

        Kobe's hometown, fans around the world, including some who do not support him, have inextricably linked with Kobe in these identities.

        Wasserman said that when these mental connections were severed, it was normal to feel sad.

        It is imperative to seek a cure for a sad resident.

        The mayor of Los Angeles, Eric Gasetti, recently revealed to the media that he will definitely hold a public commemorative event for Bryant. Gasetti believes that Los Angeles is now "fragmented."

        Citizens in Los Angeles can reinvigorate, as can Kobe fans all over the world, but this requires a process.
        """
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: ScreenWidth - 50, y: 40, width: 30, height: 30)
        btn.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func closeAction() {
        navigationController?.popViewController(animated: true)
    }
}
