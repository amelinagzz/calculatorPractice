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

    @IBOutlet weak var outputlbl : UILabel!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation = CalcService.Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(AudioService.instance.btnUrl!)
        AudioService.instance.soundFXPlayer?.prepareToPlay()
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
        processOperation(CalcService.Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPressed(sender: AnyObject) {
        leftValStr = ""
        rightValStr = ""
        currentOperation = CalcService.Operation.Empty
        result = ""
        runningNumber = ""
        outputlbl.text = result
        
    }
    func processOperation(op: CalcService.Operation){
        playSound()
        if(currentOperation != CalcService.Operation.Empty && leftValStr != ""){
            //Run some math
            //A user selected an operator, but then selected another operator without first entering a number
            if(runningNumber != ""){
                rightValStr = runningNumber
                runningNumber = ""
                
                if(currentOperation == CalcService.Operation.Multiply){
                    result = CalcService.instance.multiply(leftValStr, numStrB: rightValStr)!
                }else if (currentOperation == CalcService.Operation.Divide){
                    result = CalcService.instance.divide(leftValStr, numStrB: rightValStr)!
                }else if (currentOperation == CalcService.Operation.Subtract){
                    result = CalcService.instance.subtract(leftValStr, numStrB: rightValStr)!
                }else if (currentOperation == CalcService.Operation.Add){
                    result = CalcService.instance.add(leftValStr, numStrB: rightValStr)!
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
        AudioService.instance.playCurrentSoundFX()
    }

}

