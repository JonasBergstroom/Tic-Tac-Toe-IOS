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
    
    // All the boxes dragged in from the storyboard
    
    
    var playerNamee: String!
    var lastValue = "o"
    
    var playerChoices: [Box] = []
    var botChoices: [Box] = []
    
    
    @IBOutlet weak var botTurn: UIImageView!
    
    @IBOutlet weak var playerTurn: UIImageView!
    
    // The glowing green line that shows the turn of each player
    
    
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
        botTurn.isHidden = true
        playerTurn.isHidden = false
        imageView.addGestureRecognizer(tap)
    }
    
    // When a box is tapped the code under it will also be running
    
    
    @objc func boxClicked(_ sender: UITapGestureRecognizer) {
        
        let tappedBox = getBox(from: sender.name ?? "")
        
        guard tappedBox.image == nil else {return}
        
        // Checking so you cant click on the same box again
        
        
        
        makeMove(tappedBox)
        playerTurn.isHidden = true
        botTurn.isHidden = false
        
        
        playerChoices.append(Box(rawValue: sender.name!)!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.checkWin()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.botPlay()
        }
        
        
    }
    
    func botPlay(){
        var emptyBox = [UIImageView]()
        var emptySpaces = [Box]()
        for name in Box.allCases{
            let box = getBox(from: name.rawValue)
            
            if box.image == nil
            // Also check so the chosen box is not clicked
            {
                emptyBox.append(box)
                emptySpaces.append(name)
                playerTurn.isHidden = false
                botTurn.isHidden = true
                
                
                
            }
        }
        
        guard emptyBox.count > 0 else {return}
        
        // Prevent the bot to make a move if all the 9 boxes is already chosen
        
        let randIndex = Int.random(in: 0 ..< emptyBox.count)
        
        makeMove(emptyBox[randIndex])
        botChoices.append(emptySpaces[randIndex])
        
        // Making the bot chose randomly
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.checkWin()
            
        }
        
        
        
        
    }
    
    
    func makeMove(_ tappedBox: UIImageView) {
        
        
        guard tappedBox.image == nil else {return}
        
        // Checking so the box has not been selected
        
        
        if lastValue == "x"{
            tappedBox.image = #imageLiteral(resourceName: "O.png")
            lastValue = "o"
        }else{
            tappedBox.image = #imageLiteral(resourceName: "kisspng-letter-alphabet-fire-clip-art-5adc149dc5d909.0403148515243726378104.png")
            lastValue = "x"
        }
        
        // Making the value changes when a box is tapped
        
    }
    
    
    
    func checkWin() {
        var correct = [[Box]]()
        
        let firstRow: [Box] = [.boxone, .boxtwo, .boxthree]
        let secondRow: [Box] = [.boxfour, .boxfive, .boxsix]
        let thirdRow: [Box] = [.boxseven, .boxeight, .boxnine]
        
        
        let firstCol: [Box] = [.boxone, .boxfour, .boxseven]
        let secondCol: [Box] = [.boxtwo, .boxfive, .boxeight]
        let thirdCol: [Box] = [.boxthree, .boxsix, .boxnine]
        
        let diagonal1: [Box] = [.boxone, .boxfive, .boxnine]
        let diagonal2: [Box] = [.boxthree, .boxfive, .boxseven]
        
        
        correct.append(firstRow)
        correct.append(secondRow)
        correct.append(thirdRow)
        correct.append(firstCol)
        correct.append(secondCol)
        correct.append(thirdCol)
        correct.append(diagonal1)
        correct.append(diagonal2)
        
        // All the winning combinations
        
        for valid in correct
        
        {
            let userMatch = playerChoices.filter{
                valid.contains($0)
            }.count
            
            let botMatch = botChoices.filter{
                valid.contains($0)
            }.count
            
            // Checking if any of the players got a correct winning combination
            // If so, it will check who the winning player is
            
            if userMatch == valid.count {
                PlayerScoreLb.text = String((Int(PlayerScoreLb.text ?? "0") ?? 0) + 1)
                
                
                showToast(controller: self, message : "You won!", seconds: 1.5)
                
                playerTurn.isHidden = true
                botTurn.isHidden = true
                
                // In this case, the player won and will be added 1 point to the score
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    
                    self.resetGame()
                }
                
                
                
            }else if botMatch == valid.count {
                BotScoreLb.text = String((Int(BotScoreLb.text ?? "0") ?? 0) + 1)
                
                showToast(controller: self, message : "Bot won!", seconds: 1.5)
                
                // In this case, the bot won and will be added 1 point to the score
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.playerTurn.isHidden = false
                    self.botTurn.isHidden = true
                    self.resetGame()
                }
                
                
            }else if botChoices.count + playerChoices.count == 9 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                    
                    showToast(controller: self, message : "Draw!", seconds: 1.5)
                }
                
                // In this case, it is a draw. Because all the boxes together counts to 9, without any valid count.
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.resetGame()
                }
                
                
            }
            
            
        }
        
    }
    
    func resetGame(){
        for name in Box.allCases{
            let box = getBox(from: name.rawValue)
            box.image = nil
            
        }
        
        
        lastValue = "o"
        playerChoices = []
        botChoices = []
        
    }
    
    func getBox(from name: String) -> UIImageView {
        let box = Box(rawValue: name) ?? .boxone
        
        switch box {
        case .boxone:
            return box1
        case .boxtwo:
            return box2
        case .boxthree:
            return box3
        case .boxfour:
            return box4
        case .boxfive:
            return box5
        case .boxsix:
            return box6
        case .boxseven:
            return box7
        case .boxeight:
            return box8
        case .boxnine:
            return box9
            
        }
        
        // Will get the image view whenever each empty box is chosen by any player
    }
    
}
func showToast(controller: UIViewController, message : String, seconds: Double) {
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

enum Box: String, CaseIterable {
    case boxone, boxtwo, boxthree, boxfour, boxfive, boxsix, boxseven, boxeight, boxnine
}

// Holds the name for each slot 

