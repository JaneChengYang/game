//
//  ViewController.swift
//  game
//
//  Created by Simon on 2018/4/1.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import GameplayKit
enum Guess:String {
    case on, under, right, left
}
enum Mora:String{
    case scissors, stone, cloth
}

class ViewController: UIViewController {
    
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var oneMoreTimeButton: UIButton!
    @IBOutlet weak var pageButton: UIButton!
    @IBOutlet weak var judgmentLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var underButton: UIButton!
    @IBOutlet weak var onButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var scissorsLabel: UILabel!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var stoneButton: UIButton!
    @IBOutlet weak var clothButton: UIButton!
    let guessArray:[Guess] = [ .on, .under, .right, .left]
    let moraArray:[Mora] = [.scissors, .stone, .cloth]
    var lose = 0
    var win = 0
    var isWin = true
    func moraAfter(){
        onButton.isEnabled = false
        underButton.isEnabled = false
        rightButton.isEnabled = false
        leftButton.isEnabled = false
    }
    func guessWin(){
        scissorsButton.isHidden = true
        stoneButton.isHidden = true
        clothButton.isHidden = true
        judgmentLabel.isHidden = true
        onButton.isHidden = false
        underButton.isHidden = false
        rightButton.isHidden = false
        leftButton.isHidden = false
        myImage.image = UIImage(named: "14")
    }
    func guessLose(){
        scissorsButton.isHidden = true
        stoneButton.isHidden = true
        clothButton.isHidden = true
        judgmentLabel.isHidden = true
        onButton.isHidden = false
        underButton.isHidden = false
        rightButton.isHidden = false
        leftButton.isHidden = false
        myImage.image = UIImage(named: "15")
    }
//    
//    @IBAction func oneTimeButton(_ sender: UIButton) {
//        stoneButton.isEnabled = true
//        clothButton.isEnabled = true
//        scissorsButton.isEnabled = true
//        oneMoreTimeButton.isHidden = true
//    }
    @IBAction func sideButton(_ sender: UIButton) {
        guessLose()
        pageButton.isHidden = true
        guessLabel.isHidden = false
        scissorsLabel.isHidden = true
        guessButton.isHidden = true
        onButton.isEnabled = true
        underButton.isEnabled = true
        rightButton.isEnabled = true
        leftButton.isEnabled = true
    }

    @IBAction func nextPageButton(_ sender: UIButton) {
        guessWin()
        pageButton.isHidden = true
        guessLabel.isHidden = false
        scissorsLabel.isHidden = true
        guessButton.isHidden = true
        onButton.isEnabled = true
        underButton.isEnabled = true
        rightButton.isEnabled = true
        leftButton.isEnabled = true
    }
    
    @IBAction func moraButton(_ sender: UIButton) {
        let moraRandom = GKRandomDistribution(lowestValue: 0, highestValue: moraArray.count - 1)
        let moraNumber = moraArray[moraRandom.nextInt()]
        
        switch sender {
        case scissorsButton:
            if moraNumber == .scissors{
                judgmentLabel.isHidden = false
                judgmentLabel.text = "平局!!"
                myImage.image = UIImage(named: "3")
                stoneButton.isEnabled = false
                clothButton.isEnabled = false
                scissorsButton.isEnabled = false
                againButton.isHidden = false
            }else if moraNumber == .stone{
                judgmentLabel.isHidden = false
                judgmentLabel.text = "You Lose!!"
                myImage.image = UIImage(named: "4")
                stoneButton.isEnabled = false
                clothButton.isEnabled = false
                scissorsButton.isExclusiveTouch = false
                scissorsButton.isEnabled = false
                guessButton.isHidden = false
                isWin = false
            }else{
                judgmentLabel.text = "不錯麻～～"
                judgmentLabel.isHidden = false
                myImage.image = UIImage(named: "2")
                scissorsLabel.isHidden = true
                pageButton.isHidden = false
                stoneButton.isEnabled = false
                clothButton.isEnabled = false
                scissorsButton.isEnabled = false
                isWin = true
            }
        case stoneButton:
            if moraNumber == .stone{
                judgmentLabel.isHidden = false
                judgmentLabel.text = "平局!!"
                myImage.image = UIImage(named: "4")
                scissorsButton.isEnabled = false
                clothButton.isEnabled = false
                stoneButton.isEnabled = false
                againButton.isHidden = false
            }else if moraNumber == .scissors{
                judgmentLabel.isHidden = false
                judgmentLabel.text = "You Lose!!"
                myImage.image = UIImage(named:"2")
                scissorsButton.isEnabled = false
                clothButton.isEnabled = false
                stoneButton.isEnabled = false
                guessButton.isHidden = false
                isWin = false
            }else{
                judgmentLabel.text = "不錯麻～～"
                judgmentLabel.isHidden = false
                myImage.image = UIImage(named: "3")
                scissorsLabel.isHidden = true
                pageButton.isHidden = false
                scissorsButton.isEnabled = false
                clothButton.isEnabled = false
                stoneButton.isEnabled = false
                isWin = true
            }
        case clothButton:
            if moraNumber == .cloth{
                judgmentLabel.isHidden = false
                judgmentLabel.text = "平局!!"
                myImage.image = UIImage(named: "2")
                scissorsButton.isEnabled = false
                stoneButton.isEnabled = false
                clothButton.isEnabled = false
                againButton.isHidden = false
            }else if moraNumber == .stone{
                judgmentLabel.isHidden = false
                judgmentLabel.text = "You Lose!!"
                myImage.image = UIImage(named: "3")
                scissorsButton.isEnabled = false
                stoneButton.isEnabled = false
                clothButton.isEnabled = false
                guessButton.isHidden = false
                isWin = false
            }else{
                judgmentLabel.text = "不錯麻～～"
                judgmentLabel.isHidden = false
                myImage.image = UIImage(named: "4")
                scissorsLabel.isHidden = true
                pageButton.isHidden = false
                scissorsButton.isEnabled = false
                stoneButton.isEnabled = false
                clothButton.isEnabled = false
                isWin = true
            }
        default:
            break
        }
    }
    @IBAction func guessButton(_ sender: UIButton) {
        let guessRandom = GKRandomDistribution(lowestValue: 0, highestValue: guessArray.count - 1)
        let guessNumber = guessArray[guessRandom.nextInt()]
        switch sender {
        case onButton:
            if isWin == true{
                if guessNumber == .on{
                    moraAfter()
                    myImage.image = UIImage(named: "5")
                    judgmentLabel.text = "No~~You Win!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    win += 1
                    winLabel.text = "\(win)"
                }else if guessNumber == .under{
                moraAfter()
                myImage.image = UIImage(named: "6")
                judgmentLabel.text = "嚇我一跳！！"
                againButton.isHidden = false
                judgmentLabel.isHidden = false
            }else if guessNumber == .left{
                moraAfter()
                myImage.image = UIImage(named: "7")
                judgmentLabel.text = "嚇我一跳！！"
                againButton.isHidden = false
                judgmentLabel.isHidden = false
            }else if guessNumber == .right{
                moraAfter()
                myImage.image = UIImage(named: "8")
                judgmentLabel.text = "嚇我一跳！！"
                againButton.isHidden = false
                judgmentLabel.isHidden = false
                }
            }else  if isWin == false{
                if guessNumber == .on{
                    moraAfter()
                    myImage.image = UIImage(named: "5")
                    judgmentLabel.text = "You Lose!!"
                    againButton.isHidden = false
                    lose += 1
                    loseLabel.text = "\(lose)"
                    judgmentLabel.isHidden = false
                }else if guessNumber == .under{
                    moraAfter()
                    myImage.image = UIImage(named: "6")
                    judgmentLabel.text = "下次一定中！！"
                    againButton.isHidden = false
                    judgmentLabel.isHidden = false
                }else if guessNumber == .left{
                    moraAfter()
                    myImage.image = UIImage(named: "7")
                    judgmentLabel.text = "下次一定中！！"
                    againButton.isHidden = false
                    judgmentLabel.isHidden = false
                }else if guessNumber == .right{
                    moraAfter()
                    myImage.image = UIImage(named: "8")
                    judgmentLabel.text = "下次一定中！！"
                    againButton.isHidden = false
                    judgmentLabel.isHidden = false
                }
             }
            
            case underButton:
            if isWin == true {
                if guessNumber == .under{
                    moraAfter()
                    myImage.image = UIImage(named: "6")
                    judgmentLabel.text = "No~~You Win!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    win += 1
                    winLabel.text = "\(win)"
                }else if guessNumber == .on{
                moraAfter()
                myImage.image = UIImage(named: "5")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
            }else if guessNumber == .left{
                moraAfter()
                myImage.image = UIImage(named: "7")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
            }else if guessNumber == .right{
                moraAfter()
                myImage.image = UIImage(named: "8")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                }
            }else if isWin == false {
                if guessNumber == .under{
                    moraAfter()
                    myImage.image = UIImage(named: "6")
                    judgmentLabel.text = "You Lose!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    lose += 1
                    loseLabel.text = "\(lose)"
                }else if guessNumber == .on{
                    moraAfter()
                    myImage.image = UIImage(named: "5")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                }else if guessNumber == .left{
                    moraAfter()
                    myImage.image = UIImage(named: "7")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                }else if guessNumber == .right{
                    moraAfter()
                    myImage.image = UIImage(named: "8")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                }
            }
        
        case leftButton:
             if isWin == true{
                if guessNumber == .left{
                    myImage.image = UIImage(named: "7")
                    judgmentLabel.text = "No~~You Win!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    win += 1
                    winLabel.text = "\(win)"
                    moraAfter()
                }else if guessNumber == .under{
                myImage.image = UIImage(named: "6")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                moraAfter()
            }else if guessNumber == .on{
                myImage.image = UIImage(named: "5")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                moraAfter()
            }else if guessNumber == .right{
                myImage.image = UIImage(named: "8")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                moraAfter()
                }
             }else if isWin == false {
                if guessNumber == .left{
                    myImage.image = UIImage(named: "7")
                    judgmentLabel.text = "You Lose!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    lose += 1
                    loseLabel.text = "\(lose)"
                    moraAfter()
                }else if guessNumber == .under{
                    myImage.image = UIImage(named: "6")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    moraAfter()
                }else if guessNumber == .on{
                    myImage.image = UIImage(named: "5")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    moraAfter()
                }else if guessNumber == .right{
                    myImage.image = UIImage(named: "8")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    moraAfter()
                }
            }
        case rightButton:
            if isWin == true {
                if guessNumber == .right{
                    myImage.image = UIImage(named: "8")
                    judgmentLabel.text = "No~~You Win!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    win += 1
                    winLabel.text = "\(win)"
                    moraAfter()
                }else if guessNumber == .under{
                myImage.image = UIImage(named: "6")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                moraAfter()
            }else if guessNumber == .left{
                myImage.image = UIImage(named: "7")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                moraAfter()
            }else if guessNumber == .on{
                myImage.image = UIImage(named: "5")
                judgmentLabel.text = "嚇我一跳！！"
                judgmentLabel.isHidden = false
                againButton.isHidden = false
                moraAfter()
                }
            } else if isWin == false {
                if guessNumber == .right{
                    myImage.image = UIImage(named: "8")
                    judgmentLabel.text = "You Lose!!"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    lose += 1
                    loseLabel.text = "\(lose)"
                    moraAfter()
                }else if guessNumber == .under{
                    myImage.image = UIImage(named: "6")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    moraAfter()
                }else if guessNumber == .left{
                    myImage.image = UIImage(named: "7")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    moraAfter()
                }else if guessNumber == .on{
                    myImage.image = UIImage(named: "5")
                    judgmentLabel.text = "下次一定中！！"
                    judgmentLabel.isHidden = false
                    againButton.isHidden = false
                    moraAfter()
                }
            }
            
        default:
            break
        }
    }
    @IBAction func playButton(_ sender: UIButton) {
        scissorsButton.isHidden = false
        stoneButton.isHidden = false
        clothButton.isHidden = false
        judgmentLabel.isHidden = true
        onButton.isHidden = true
        underButton.isHidden = true
        rightButton.isHidden = true
        leftButton.isHidden = true
        scissorsButton.isEnabled = true
        stoneButton.isEnabled = true
        clothButton.isEnabled = true
        againButton.isHidden = true
        myImage.image = UIImage(named: "16")
    }
    
    @IBAction func renewButton(_ sender: UIButton) {        
        lose = 0
        win = 0
        winLabel.text = "0"
        loseLabel.text = "0"
        scissorsButton.isHidden = false
        stoneButton.isHidden = false
        clothButton.isHidden = false
        judgmentLabel.isHidden = false
        onButton.isHidden = true
        underButton.isHidden = true
        rightButton.isHidden = true
        leftButton.isHidden = true
        scissorsLabel.isHidden = false
        scissorsButton.isEnabled = true
        stoneButton.isEnabled = true
        clothButton.isEnabled = true
        judgmentLabel.isHidden = true
        pageButton.isHidden = true
        guessLabel.isHidden = true
        oneMoreTimeButton.isHidden = true
        guessButton.isHidden = true
        againButton.isHidden = true
        myImage.image = UIImage(named: "1")
        moraAfter()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

