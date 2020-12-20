//
//  GameViewControllers.swift
//  Tic-Tac-Toe-IOS
//
//  Created by Jonas Bergström on 2020-12-18.
//

import UIKit

class GameViewControllers: UIViewController {
    
    @IBOutlet weak var PlayerNameLb: UILabel!
    
    
    @IBOutlet weak var PlayerScoreLb: UILabel!
    
    
    @IBOutlet weak var BotScoreLb: UILabel!
    
    
    @IBOutlet weak var box1: UIImageView!
    
    
    @IBOutlet weak var box2: UIImageView!
    

    @IBOutlet weak var box3: UIImageView!
    
    
    @IBOutlet weak var box4: UIImageView!
    
    
    @IBOutlet weak var box5: UIImageView!
    
    
    @IBOutlet weak var box6: UIImageView!
    
    
    @IBOutlet weak var box7: UIImageView!
    
    
    
    @IBOutlet weak var box8: UIImageView!
    
    
    
    @IBOutlet weak var box9: UIImageView!
    
    
    var playerNamee: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayerNameLb.text = playerNamee + ":"
        
        boxTapped(on: box1, type: .boxone)
        boxTapped(on: box2, type: .boxtwo)
        boxTapped(on: box3, type: .boxthree)
        boxTapped(on: box4, type: .boxfour)
        boxTapped(on: box5, type: .boxfive)
        boxTapped(on: box6, type: .boxsix)
        boxTapped(on: box7, type: .boxseven)
        boxTapped(on: box8, type: .boxeight)
        boxTapped(on: box9, type: .boxnine)

    
    }
    
    func boxTapped(on imageView: UIImageView, type box: Box) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.boxClicked(_:)))
        tap.name = box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func boxClicked(_ sender: UITapGestureRecognizer) {
        print("Box: \(sender.name) was clicked")
    }
}
enum Box: String, CaseIterable {
    case boxone, boxtwo, boxthree, boxfour, boxfive, boxsix, boxseven, boxeight, boxnine
}
