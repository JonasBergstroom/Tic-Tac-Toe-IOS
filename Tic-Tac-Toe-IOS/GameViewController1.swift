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
    
    
    var activePlayer = 1 // Cross
    
    var gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // The game board is marked here, and it all start with 0 (clear board)
    
    // When any of the players chose a empty space on the board it will be given the number of 1 or 2, in this case the player will have the value 1 and the bot value 2
    
    @IBOutlet weak var player1Turn: UIImageView!
    
    
    @IBOutlet weak var player2Turn: UIImageView!
    
    
    
    var winCombinations = [[0,1,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    // This is all the combinations for the winning state
    
    var gameIsActive = true
    
    // Checks if the game is active
    
    
    @IBAction func Game(_ sender: Any) {
        
        
        
        if (gamePlay[(sender as AnyObject).tag-1] == 0 && gameIsActive == true) {
            
            // Checking if there is a empty space on the board and if the game is active
            // Both requirements must be met
            
            gamePlay[(sender as AnyObject).tag-1] = activePlayer
            
            
            if (activePlayer == 1)
            
            {
                (sender as AnyObject).setImage(UIImage(named: "crosss.png"), for: UIControl.State())
                
                // Makes the player 1 start the game, when a empty space is chosen it will be a cross added on that space
                
                player2Turn.isHidden = false
                player1Turn.isHidden = true
                
                
                activePlayer = 2
                
            }
            else {
                (sender as AnyObject).setImage(UIImage(named: "O.png"), for: UIControl.State())
                
                // Makes the player 2 turn, when a empty space is chosen it will be a O added on that space
                
                player2Turn.isHidden = true
                player1Turn.isHidden = false
                
                
                
                activePlayer = 1
            }
            
            
            for combinations in winCombinations {
                
                
                
                if gamePlay[combinations[0]] != 0 && gamePlay[combinations[0]] == gamePlay[combinations[1]] && gamePlay[combinations[1]] == gamePlay[combinations[2]] {
                    
                    // Checking if any of the winning combinations match for any of the player
                    
                    // If so, the code under will check who the winner is
                    
                    gameIsActive = false
                    
                    if gamePlay[combinations[0]] == 1 {
                        player1Score.text = String((Int(player1Score.text ?? "0") ?? 0) + 1)
                        
                        // If the player wins he/she will be added 1 point
                        
                        showToast(controller: self, message : "\(player1Namee as String) won!", seconds: 1.5)
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            self.resetGamee()
                        }
                        
                    }else{
                        
                        player2Score.text = String((Int(player2Score.text ?? "0") ?? 0) + 1)
                        
                        // If the bot wins it will be added 1 point
                        
                        
                        showToast(controller: self, message : "\(player2Namee as String) won!", seconds: 1.5)
                        
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
        
        // If it still a empty space the loop breaks
        
        
        if gameIsActive == false {
            showToast(controller: self, message : "Draw", seconds: 1.5)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.resetGamee2()
            }
            
        }
        
        // If no empty space is avaible, the game will not be acitve(false) and run the draw code
        
        
    }
    
    
    func resetGamee() {
        
        
        gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 2
        
        var buttonsToClear : UIButton
        
        for view in view.subviews {
            if let button = view as? UIButton {
                if button.tag > 0 || button.tag > 9 {
                    buttonsToClear = button
                    buttonsToClear.setImage(nil, for: UIControl.State())
                }
            }
        }
        
        
        
    }
    
    // Clearing the board after a player wins, and make the activePLayer = 2 starts
    
    
    
    func resetGamee2() {
        
        
        gamePlay = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        var buttonsToClear : UIButton
        
        for view in view.subviews {
            if let button = view as? UIButton {
                if button.tag > 0 || button.tag > 9 {
                    buttonsToClear = button
                    buttonsToClear.setImage(nil, for: UIControl.State())
                }
            }
        }
        
        
        
    }
    
    // Clearing the board after a player wins, and make the activePLayer = 1 starts
    
    
    
    
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

// Function and design for the toast
