//
//  GameViewController1.swift
//  Tic-Tac-Toe-IOS
//
//  Created by Jonas Bergström on 2021-01-04.
//

import UIKit

class GameViewController1: UIViewController {
    
    
    
    @IBOutlet weak var player1Score: UILabel!
    
    
    @IBOutlet weak var player2Score: UILabel!
    
        
    var activePlayer = 1
    
    var gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    @IBOutlet weak var player1Turn: UIImageView!
    
    
    @IBOutlet weak var player2Turn: UIImageView!
    

    
    var winCombinations = [[0,1,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameIsActive = true

    
    
    
    @IBAction func Game(_ sender: Any) {
        
        
        
        if (gamePlay[(sender as AnyObject).tag-1] == 0 && gameIsActive == true) {
            
            gamePlay[(sender as AnyObject).tag-1] = activePlayer
            

            if (activePlayer == 1)
                       
                       {
                           (sender as AnyObject).setImage(UIImage(named: "crosss.png"), for: UIControl.State())
                           player2Turn.isHidden = false
                           player1Turn.isHidden = true


                           activePlayer = 2
                
                       }
                       else {
                           (sender as AnyObject).setImage(UIImage(named: "O.png"), for: UIControl.State())
                           player2Turn.isHidden = true
                           player1Turn.isHidden = false


                           
                           activePlayer = 1
                       }
            
            
            for combinations in winCombinations {
                

                
                if gamePlay[combinations[0]] != 0 && gamePlay[combinations[0]] == gamePlay[combinations[1]] && gamePlay[combinations[1]] == gamePlay[combinations[2]] {
                    
                    gameIsActive = false
                    
                    if gamePlay[combinations[0]] == 1 {
                        player1Score.text = String((Int(player1Score.text ?? "0") ?? 0) + 1)

                        
                        showToast(controller: self, message : "Player 1 won!", seconds: 1.5)
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                      self.resetGamee()
                                  }
                        
                    }else{
                        
                        player2Score.text = String((Int(player2Score.text ?? "0") ?? 0) + 1)

                    
                        showToast(controller: self, message : "Player 2 won!", seconds: 1.5)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                      self.resetGamee2()
                                  }
                
                    
                    }
                }
            }
            
                   }
        
        
        gameIsActive = false
        
        for i in gamePlay
        {
            if i == 0{
                gameIsActive = true
                break
            }
        }
        
        
        if gameIsActive == false {
            showToast(controller: self, message : "Draw", seconds: 1.5)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                          self.resetGamee2()
                      }

        }

            
        }
    
    
    func resetGamee() {
    
        
        gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 2
        
        var buttonsToClear : UIButton

        for view in view.subviews { // Loop through subviews
            if let button = view as? UIButton { // Check if UIButton
                if button.tag > 0 || button.tag > 9 { // Check tags
                    buttonsToClear = button
                    buttonsToClear.setImage(nil, for: UIControl.State())
                }
            }
        }
     
        
        
    }
    
    
    
    func resetGamee2() {
    
        
        gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        var buttonsToClear : UIButton

        for view in view.subviews { // Loop through subviews
            if let button = view as? UIButton { // Check if UIButton
                if button.tag > 0 || button.tag > 9 { // Check tags
                    buttonsToClear = button
                    buttonsToClear.setImage(nil, for: UIControl.State())
                }
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


