//
//  ViewController.swift
//  Calculator
//
//  Created by Gabrielle Brandenburg dos Anjos on 03/03/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Labels
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var MR: UIButton!
    @IBOutlet weak var Mplus: UIButton!
    @IBOutlet weak var DEL: UIButton!
    @IBOutlet weak var AC: UIButton!
    
    @IBOutlet weak var blurredView: UIView!
    
 //MARK: Variaveis globais
    var displayValue: String = "0"
    var firstDigit = true
    var op = ""
    var currentValue = 0.0
    var secondValue = 0.0
    var result = "0.0"
    var memory = "0.0"
    var equalsLock = false
    var dotLock = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Configura o efeito desfocado da tela de ajuda
        insertBlurView(blurredView, style: UIBlurEffectStyle.light)
        self.blurredView.isHidden = true
        self.blurredView.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBAction func numberInput(_ sender: UIButton) {
        
        equalsLock = false
        if firstDigit == true {
            if sender.currentTitle == "0" {
                //não deixa o usuário deletar o padrão do display
            } else if sender.currentTitle != "DEL" {
                display.text = sender.currentTitle!
                firstDigit = false
            }
        } else {
            //
            if sender.currentTitle == "DEL" {
                if display.text!.characters.last == "." {
                    dotLock = false
                }
                display.text = String(display.text!.characters.dropLast())
                if display.text == "" {
                    display.text = "0"
                    firstDigit = true
                }
            } else {
                display.text = display.text! + sender.currentTitle!
            }
        }
    }

    @IBAction func operation(_ sender: UIButton) {
        firstDigit = true
        //secondValue = currentValue
        if display.text != "Error" {
        currentValue = NumberFormatter().number(from: display.text!)!.doubleValue
        print(secondValue)
        print(currentValue)

        op = sender.currentTitle!
        }
        
    }
    
    @IBAction func equalsTo(_ sender: AnyObject) {
        firstDigit = true
        
        if !equalsLock {
        secondValue = currentValue
        if display.text != "Error" {
        currentValue = NumberFormatter().number(from: display.text!)!.doubleValue
        print(secondValue)
        print(currentValue)
        
        result = doMath(op, value1: secondValue, value2: currentValue)
        
        //currentValue = result
        //secondValue = result
        let resultStr = ("\(result)")
        display.text = resultStr.trunc(9)
        equalsLock = true
        }
        print("___ ")
        print(result)
        print("\n")
        }
        
        
        
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        currentValue = 0.0
        secondValue = 0.0
        result = "0.0"
        display.text = "0"
        print("===============")
        firstDigit = true
        dotLock = false
    }
    
    @IBAction func addDot(_ sender: UIButton) {
        if sender.currentTitle == "." {
            if dotLock == false {
                //                dotLock = true
                //                display.text = display.text! + sender.currentTitle!
                //
                //            }
                //        } else
                if firstDigit {
                    display.text = "0" + sender.currentTitle!
                    firstDigit = false
                } else {
                    display.text = display.text! + sender.currentTitle!
                }
                
            }
            dotLock = true
        }
    }
    
    @IBAction func addMemory(_ sender: AnyObject) {
        memory = display.text!
        firstDigit = true
        print(memory)
    }
    
    @IBAction func showMemoryDisplay(_ sender: UIButton) {
        equalsLock = false
        display.text = memory
    }
    
    func doMath(_ op: String, value1: Double, value2: Double) -> String {
        var res = 0.0
        switch op {
            case "+":
                res = value1 + value2
            case "-":
                res = value1 - value2
            case "x":
                res = value1 * value2
            case "÷":
                if value2 == 0 {
                    return "Error"
                }
                res = value1 / value2
            case "√":
                res = sqrt(value1)
            case "%":
                res = (value1*value2)/100

            
            default:
                print("Error")
        }
        return String(res)
    }
    
    func writeDisplay (_ button: String){
        display.text = display.text! + button
    }
    
    
    @IBAction func showHelpView(_ sender: AnyObject) {
        //blurredView.alpha = 0
        self.blurredView.isHidden = false
        blurredView.fadeIn()
        print(self.blurredView.alpha)
       
    }
    
    
    
    @IBAction func hideHelpView(_ sender: AnyObject) {
        blurredView.fadeOut()
        print(#function)
//        if (self.blurredView.alpha == 0.0){
//        self.blurredView.hidden = true
//        }
        //print(self.blurredView.alpha)
        //blurredView.alpha = 1
    }
    

}

