//
//  LotteryHint.swift
//  Practice-first
//
//  Created by pathomphong charoenwichianchay on 10/8/2562 BE.
//  Copyright © 2562 pathomphong charoenwichianchay. All rights reserved.
//


import UIKit

class LotteryHintController: UIViewController {
    var pressCount = 0
    @IBOutlet weak var RandomButton: UIButton!
    @IBOutlet weak var LotteryNumber: UILabel!
    @IBAction func PressedRandomNumber() {
        let number = Int.random(in: 0...999999)
        let limitNumber = String(format: "%06d", number)
        LotteryNumber.text = limitNumber
    }
    @IBAction func PressedRandomColor() {
        let rgbaRed = CGFloat(Float.random(in: 0...1))
        let rgbaGreen = CGFloat(Float.random(in: 0...1))
        let rgbaBlue = CGFloat(Float.random(in: 0...1))
        let color = UIColor(red: rgbaRed, green: rgbaGreen, blue: rgbaBlue, alpha: 0.5)
        LotteryNumber.backgroundColor = color
        if (rgbaRed<0.5&&rgbaGreen<0.5&&rgbaBlue<0.5){
            LotteryNumber.textColor = UIColor(white: 1.0, alpha: 1.0)
        }else{
            LotteryNumber.textColor = UIColor(white: 0, alpha: 1.0)
        }
    }
    @IBAction func PressedLimitation() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        PressedRandomColor()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        PressedRandomNumber()
        PressedRandomColor()
    }
    
}
