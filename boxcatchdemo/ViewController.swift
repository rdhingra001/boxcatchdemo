//
//  ViewController.swift
//  boxcatchdemo
//
//  Created by Ronit Dhingra on 7/8/20.
//  Copyright © 2020 Ronit Dhingra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Connect the image views from the storyboard to the code
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    // Connecting the selector buttons on the storyboard to the code
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    // Referencing the images from the Assets.xcassets to the code
    let box =  UIImage.init(named: "box")
    let thiefCoins = UIImage.init(named: "thiefCoin")
    let receiveCoins = UIImage.init(named: "receiveMoney")
    let clownCoins = UIImage.init(named: "clownCoin")
    let coinCounterImage = UIImage.init(named: "coinCounter")
        
    // Initializing the coin amount that the user has
    @IBOutlet weak var coinCounter: UILabel!
    let startingValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinCounter.text = "\(startingValue)"
    }
    
    // The actions called when the first button is tapped
    @IBAction func firstButtonTapped(_ sender: Any) {
        
        // Check if user amount equals zero
        if coinCounter.text == "0" {
            self.checkCoinCount(firstImageView)
        }
        
        
    }
    
    // The actions called when the second button is tapped
    @IBAction func secondButtonTapped(_ sender: Any) {
        
        let coinCount = Int(coinCounter.text!)
        
        // Check the user amounts
        self.checkCoinCount(secondImageView, counter: coinCount!)
    
    // The actions called when the third button is tapped
    @IBAction func thirdButtonTapped(_ sender: Any) {
        
        let coinCount = Int(coinCounter.text!)
        
        // Check if user amount equals zero
        if coinCounter.text == "0" {
            self.checkCoinCount(thirdImageView, counter: coinCount!)
        }
    }
    
    // Function to check if user amount equals zero; rigged to give them all coins
    func checkCoinCount(_ imageView: UIImageView, imgVw2: UIImageView, imgVw3: UIImageView, counter: Int) {
        var counter2: Int
        
        if counter > -1 && counter < 51 {
            waitAndFix1(3.5, imageView: imageView, imgVw2: imgVw2, imgVw3: imgVw3, count: counter)
            counter2 = counter + 150
            coinCounter.text = String(counter2)
        }
        else if counter2 > 149 && counter2 < 451 {
            waitAndFix2(3.5, imageView: imageView, imgVw2: imgVw2, imgVw3: imgVw3, count: counter2)
            
            if imageView.image == receiveCoins {
                counter2 += 150
                coinCounter.text = String(counter2)
            }
            else if imageView.image == thiefCoins {
                counter2 -= 100
                coinCounter.text = String(counter2)
            }
        }
    }
    
    func waitAndFix1(_ sec:Double, imageView: UIImageView, imgVw2: UIImageView, imgVw3: UIImageView, count: Int) {
        
        // Change the image view to the wad of money to add money to counter
        DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
            imageView.image = self.receiveCoins
        }
    }
        
    func waitAndFix2(_ sec:Double, imageView:UIImageView, imgVw2:UIImageView, imgVw3: UIImageView, count: Int)  {
         let images = [imageView, imgVw2, imgVw3]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
            imageView.image = images.randomElement()!.image
        }
    }

}

}
