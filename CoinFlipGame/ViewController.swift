//
//  ViewController.swift
//  CoinFlipGame
//
//  Created by Mingxi Chen on 2/17/18.
//  Copyright © 2018 Mingxi Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var btnCoins: [UIButton]!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var count = 1
    var firstCoin = Int()
    var secondCoin = Int()
    var thirdCoin = Int()
    
    enum Result : String{
        case WINNER
        case LOST
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnFlip(_ sender: UIButton) {
        let tag = sender.tag
        let num : Int = Int(arc4random_uniform(2))
        if(count == 3){
            if(firstCoin == secondCoin && secondCoin == thirdCoin){
                infoLabel.text = Result.WINNER.rawValue
            }else{
                infoLabel.text = Result.LOST.rawValue
            }
            
        }else{
            var image = UIImage(named:"coin")
            // Decide set the image to head or tail
            if(num == 0){
                image = UIImage(named:"head")
            }else{
                image = UIImage(named:"tail")
            }
            btnCoins[tag].setImage(image,for: .normal)
            UIView.transition(with: btnCoins[tag], duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            btnCoins[tag].isEnabled = false
            count += 1
            switch tag{
            case 0: firstCoin = num
            case 1: secondCoin = num
            case 2: thirdCoin = num
            default: print("Invalid value")
            }
        
        }
    }

    @IBAction func resetBtn(_ sender: Any) {
        for button in btnCoins{
            let image = UIImage(named:"coin")
            button.setImage(image,for: .normal)
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            button.isEnabled = true
            infoLabel.text = ""
            count = 1
        }
    }
    

}

