//
//  SecondViewController.swift
//  03-coding
//
//  Created by Sergio on 04/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelGoldNumber: UILabel!
    
    
    var fibonacci : [Int] = [0,1]
    var fibId = 1
    var wantsGoldnum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLabel(id: Int(stepper.value))
    }

    
    func generateFiboNumbers(){
        
        if (fibId<=1 || fibId>100) {
            return
        }
        
        fibonacci = [0,1]
        
        //Generar los numeros de fibonacci hasta fibId
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        
        //Para pasar la sucesion de fibonacci a string
        let fibStr : [String] = fibonacci.compactMap ({ String($0) })
        
        /*Lo anterior es como hacer el bucle
        for i in fibonacci{
            String{i}
        }*/
        
        let result : String = fibStr.joined(separator: "\n")
        textViewResult.text = result
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        updateLabel(id: Int(sender.value))
        
    }
    
    func updateLabel(id: Int){
        //Recoger el numero del stepper y mostrarlo en el label
        fibId = id
        labelNumber.text = "\(fibId)"
        
        generateFiboNumbers()
        calculateGoldNum()
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        
        wantsGoldnum = sender.isOn
        calculateGoldNum()
        
    }
    
    func calculateGoldNum(){
        
        if (wantsGoldnum) {
            //Mostrar el numero de oro cociente entre los dos ultimos numeros de fibonacci
            let last = Double(fibonacci[fibonacci.count-1])
            let previous = Double(fibonacci[fibonacci.count-2])
            let goldNum = last/previous
            labelGoldNumber.text = "\(goldNum)"
        } else {
            //Texto por defecto en el label
            labelGoldNumber.text = "Ver el número de oro"
        }
        
    }
    
}

