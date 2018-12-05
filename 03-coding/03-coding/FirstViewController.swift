//
//  FirstViewController.swift
//  03-coding
//
//  Created by Sergio on 04/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge : Int = -1
    var userName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateAgeLabel()
        
    }

    //Hace falta crear un delegado para poder usar las funciones del textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Para cerrar el teclado o cualquier cosa que estuviera usando el textfield
        textField.resignFirstResponder()
        
        //Forma segura de recuperar datos del textfield. Si se crea la constante, se imprime por pantalla
        if let texto = textField.text {
            print(texto)
            userName = texto
        }
        
        return true
    }
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        
        updateAgeLabel()
        
    }
    
    func updateAgeLabel() {
        userAge = Int(sliderAge.value)
        labelAge.text = "\(userAge)"
    }
    
    @IBAction func validarDatos(_ sender: UIButton) {
        
        let shouldEnterParty = (userName == "Sergio Martin") || (userAge >= 18)
        
        if shouldEnterParty {
            print("Bienvenido a la fiesta")
            view.backgroundColor = UIColor(displayP3Red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        } else {
            print("Lo siento, no puedes acceder a la fiesta")
            view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
        }
        
        /*
        if userName == "Sergio Martin" {
            print("Puedes pasar a la fiesta, jefe")
            view.backgroundColor = UIColor(displayP3Red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        } else {
            if userAge >= 18 {
                print("Puedes pasar a la fiesta por se mayor de edad")
                view.backgroundColor = UIColor(displayP3Red: 50.0/255.0, green: 160.0/255.0, blue: 250.0/255.0, alpha: 0.7)
            } else {
                print("Lo siento, no puedes acceder a la fiesta")
                view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
            }
        }*/
        
    }
    
}

