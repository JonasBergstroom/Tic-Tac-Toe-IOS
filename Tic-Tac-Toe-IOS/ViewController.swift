//
//  ViewController.swift
//  Tic-Tac-Toe-IOS
//
//  Created by Jonas Bergström on 2020-12-17.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameField: UITextField!
    
    
    
    @IBOutlet weak var player1namefield: UITextField!
    
    @IBOutlet weak var player2namefield: UITextField!
    
    @IBOutlet weak var startBtn: UIButton!
    
    
    @IBOutlet weak var cardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func Started(_ sender: UIButton) {
        
        guard !nameField.text!.trimmingCharacters(in: .whitespaces).isEmpty else
        {return
            
            
            // Here is the page when you chose "BotPlay"
            
            // You will need to write a name, otherwise you cant continue
            
            showToast(controller: self, message : "Write a name!", seconds: 1.2)
            
        }
        let controller = storyboard?.instantiateViewController(identifier: "gameScenee") as!
            GameViewControllers
        controller.playerNamee = nameField.text
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
        
        
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
    
    // Design the function for the toast
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NameToGame" {
            
            guard !player1namefield.text!.trimmingCharacters(in: .whitespaces).isEmpty && !player2namefield.text!.trimmingCharacters(in: .whitespaces).isEmpty  else
            {return
                
                // Here is the page when you chose "Player vs Player"
                
                // You will need to write a name for each player, otherwise you cant continue
                
                
                showToast(controller: self, message : "Both players needs a name!", seconds: 1.2)
                
            }
            if let controller = segue.destination as? GameViewController1{
                controller.player1Namee = player1namefield.text
                controller.player2Namee = player2namefield.text
            }
        }
    }
    
}







