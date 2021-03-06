//
//  ViewController.swift
//  TicTacToe
//
//  Created by Elias Myronidis on 25/4/17.
//  Copyright © 2017 eliamyro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // 1 is noughts, 2 is crosses
    private var activePlayer = 1
    
    private var activeGame = true
    
    // 0 is empty, 1 is noughts, 2 is crosses
    private var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    private var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]]{
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Noughts has won!"
                    } else {
                        winnerLabel.text = "Crosses has won!"
                    }
                    
                    UIView.animate(withDuration: 2, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x+500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x+500, y: self.playAgainButton.center.y)
                    })
                }
            }
         }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        activePlayer = 1
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    
}

