//
//  GameViewController1.swift
//  Tic-Tac-Toe-IOS
//
//  Created by Jonas Bergström on 2021-01-04.
//

import UIKit

class GameViewController1: UIViewController {
    
    
    @IBOutlet weak var player1NameLB: UILabel!
    
    @IBOutlet weak var player2NameLB: UILabel!
    
    
    @IBOutlet weak var player1ScoreLB: UILabel!
    
    
    @IBOutlet weak var player2ScoreLB: UILabel!
    
    
    
    @IBOutlet weak var box1: UIImageView!
    
    @IBOutlet weak var box2: UIImageView!
    
    
    @IBOutlet weak var box3: UIImageView!
    
    
    @IBOutlet weak var box4: UIImageView!
    
    
    @IBOutlet weak var box5: UIImageView!
    
    
    @IBOutlet weak var box6: UIImageView!
    
    
    @IBOutlet weak var box7: UIImageView!
    
    
    @IBOutlet weak var box8: UIImageView!
    
    
    @IBOutlet weak var box9: UIImageView!
    
    
    
    var player1Namee: String!
    var player2Namee: String!
    var lastValue = "o"
    
    var player1Choices: [Boxx] = []
    var player2Choices: [Boxx] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1NameLB.text = player1Namee
        player2NameLB.text = player2Namee
        
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
      
        
        let tappedBox = getBox(from: sender.name ?? "")
        
        makeMove(tappedBox)
        
        player1Choices.append(Boxx(rawValue: sender.name!)!)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            self.checkWin()
        }
        
        player2()


    }
    
    func player2(){
        var emptyBox = [UIImageView]()
        var emptySpaces = [Boxx]()
        for name in Boxx.allCases{
            let box = getBox(from: name.rawValue)
            if box.image == nil {
                emptyBox.append(box)
                emptySpaces.append(name)
                
            }
        }
        
        guard emptySpaces.count > 0 else {return}
        
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            self.checkWin()
        
        }
    
 
    }
    
    func makeMove(_ tappedBox: UIImageView) {
        guard tappedBox.image == nil else {return}
        
        if lastValue == "x"{
            tappedBox.image = #imageLiteral(resourceName: "computer-icons-letter-download-icons-letter-o-png-34a35391e9a0eef9cd36e5590d551225.png")
            lastValue = "o"
        }else{
            tappedBox.image = #imageLiteral(resourceName: "kisspng-letter-alphabet-fire-clip-art-5adc149dc5d909.0403148515243726378104.png")
            lastValue = "x"
        }
        
    }
        
        
        
        func checkWin() {
            var correct = [[Boxx]]()
           
            let firstRow: [Boxx] = [.boxone, .boxtwo, .boxthree]
            let secondRow: [Boxx] = [.boxfour, .boxfive, .boxsix]
            let thirdRow: [Boxx] = [.boxseven, .boxeight, .boxnine]
            
            
             let firstCol: [Boxx] = [.boxone, .boxfour, .boxseven]
             let secondCol: [Boxx] = [.boxtwo, .boxfive, .boxeight]
             let thirdCol: [Boxx] = [.boxthree, .boxsix, .boxnine]
            
            let diagonal1: [Boxx] = [.boxone, .boxfive, .boxnine]
            let diagonal2: [Boxx] = [.boxthree, .boxfive, .boxseven]
            
            
            correct.append(firstRow)
            correct.append(secondRow)
            correct.append(thirdRow)
            correct.append(firstCol)
            correct.append(secondCol)
            correct.append(thirdCol)
            correct.append(diagonal1)
            correct.append(diagonal2)
            
            
            for valid in correct
            
            {
                let player1Match = player1Choices.filter{
                    valid.contains($0)
                }.count
                
                let player2Match = player2Choices.filter{
                    valid.contains($0)
                }.count
                
                if player1Match == valid.count {
                    
                    showToast(controller: self, message : "You won!", seconds: 2.0)
                

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        self.resetGame()
                    }
                    
                    
                }else if player2Match == valid.count {
                    
                    showToast(controller: self, message : "Bot won!", seconds: 2.0)

                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        self.resetGame()
                    }
                    
                    
                }else if player2Choices.count + player1Choices.count == 9 {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){

                    showToast(controller: self, message : "Draw!", seconds: 2.0)
                }

                  
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        self.resetGame()
                    }
                    
                    
                }
                
                
            }

    }
    
    func resetGame(){
        for name in Boxx.allCases{
            let box = getBox(from: name.rawValue)
            box.image = nil
            
        }
        
        lastValue = "o"
        player1Choices = []
        player2Choices = []

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




