//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Adriana Gonzalez on 2/8/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation : String {
        case Divide
        case Multiply
        case Subtract
        case Add
        case Empty
        case Clear
    }
    
    @IBOutlet weak var outputlbl : UILabel!
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {

        return UIStatusBarStyle.LightContent
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberPressed(btn: UIButton!){
        playSound()
        runningNumber += "\(btn.tag)"
        outputlbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPressed(sender: AnyObject) {
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
        runningNumber = ""
        outputlbl.text = result
        
    }
    func processOperation(op: Operation){
        playSound()
        if(currentOperation != Operation.Empty && leftValStr != ""){
            //Run some math
            //A user selected an operator, but then selected another operator without first entering a number
            if(runningNumber != ""){
                rightValStr = runningNumber
                runningNumber = ""
                
                if(currentOperation == Operation.Multiply){
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if (currentOperation == Operation.Divide){
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if (currentOperation == Operation.Subtract){
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }else if (currentOperation == Operation.Add){
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputlbl.text = result
            }
            currentOperation = op

            
        }else{
            //This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
            
        }
    }
    
    func playSound(){
        if(btnSound.playing){
            btnSound.stop()
        }
        btnSound.play()
    }

}

