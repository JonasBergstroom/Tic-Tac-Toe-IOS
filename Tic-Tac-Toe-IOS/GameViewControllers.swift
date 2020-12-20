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

    
    }
        

}
