//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Thanh Vuong on 1/16/18.
//  Copyright © 2018 Thanh Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var resultLabel: UILabel!
    // 1 is nought, 2 is cross
    var activeGame = true
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 - empty, 1 - nought, 2 -cross
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1{
                sender.setImage(UIImage(named: "nought.png"),for:[])
                activePlayer = 2
                
            }else{
                sender.setImage(UIImage(named: "cross.png"),for:[])
                activePlayer = 1
            }
        }
        for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                activeGame = false
                resultLabel.isHidden = false
                playButton.isHidden = false

                if gameState[combination[0]] == 1{
                    resultLabel.text = "Nought has won!!"
                    
                }else{
                    resultLabel.text = "Cross has won!!"
                }
                playButton.setTitle("Play Again", for: [])
                UIView.animate(withDuration: 1, animations: {
                    self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 500,y: self.resultLabel.center.y)
                    self.playButton.center = CGPoint(x: self.playButton.center.x + 500,y: self.playButton.center.y)
                })
            }
        }
    }
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playBtn(_ sender: AnyObject) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
            resultLabel.isHidden = true
            playButton.isHidden = true
            resultLabel.center = CGPoint(x: resultLabel.center.x - 500,y: resultLabel.center.y)
            playButton.center = CGPoint(x: playButton.center.x - 500,y: playButton.center.y)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.isHidden = true
        playButton.isHidden = true

        resultLabel.center = CGPoint(x: resultLabel.center.x - 500,y: resultLabel.center.y)
        playButton.center = CGPoint(x: playButton.center.x - 500,y: playButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

