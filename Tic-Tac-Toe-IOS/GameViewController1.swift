//
//  GameViewController1.swift
//  Tic-Tac-Toe-IOS
//
//  Created by Jonas Bergström on 2021-01-04.
//

import UIKit

class GameViewController1: UIViewController {
    
    var activePlayer = 1
    
    var gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    
    
    
    @IBAction func Game(_ sender: Any) {
        
        if (gamePlay[(sender as AnyObject).tag-1] == 0) {
            
            gamePlay[(sender as AnyObject).tag-1] = activePlayer

            if (activePlayer == 1)
                       
                       {
                           (sender as AnyObject).setImage(UIImage(named: "crosss.png"), for: UIControl.State())
                           
                           activePlayer = 2
                       }
                       else {
                           (sender as AnyObject).setImage(UIImage(named: "O.png"), for: UIControl.State())
                           
                           activePlayer = 1
                       }
                       
                   }

            
        }
    

    
    
    
    @IBOutlet weak var player1NameLB: UILabel!
    
    @IBOutlet weak var player2NameLB: UILabel!
    
    
    @IBOutlet weak var player1ScoreLB: UILabel!
    
    
    @IBOutlet weak var player2ScoreLB: UILabel!
    
    
    

    
    
    var player1Namee: String!
    var player2Namee: String!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1NameLB.text = player1Namee
        player2NameLB.text = player2Namee
        
      
    
    }
    

}


func showToastt(controller: UIViewController, message : String, seconds: Double) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15

    controller.present(alert, animated: true)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
        alert.dismiss(animated: true)
    }
}


enum Boxx: String, CaseIterable {
    case boxone, boxtwo, boxthree, boxfour, boxfive, boxsix, boxseven, boxeight, boxnine
}


