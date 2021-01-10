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
        
        guard !nameField.text!.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        let controller = storyboard?.instantiateViewController(identifier: "gameScenee") as!
        GameViewControllers
        controller.playerNamee = nameField.text
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
 
        
    }
    

    
 //   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   //     nameField.resignFirstResponder()
   // }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GameViewController1{
            controller.player1Namee = player1namefield.text
            controller.player2Namee = player2namefield.text


    }
   
    }


    }

