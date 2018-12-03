//
//  ViewController.swift
//  02-dices
//
//  Created by Sergio on 03/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    var randomDiceIndexLeft: Int = 0
    var randomDiceIndexRight: Int = 0
    
    let diceImages : [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    //Para numeros random hace falta que sean UInt32 para la funcion arc4random
    let nFaces : UInt32
    //Para poder iniciar la variable nFaces correctamente hay que usar un init:
    required init?(coder aDecoder: NSCoder) {
        nFaces = UInt32 (diceImages.count)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomDices()
    }


    //Metodos
    @IBAction func rollPressed(_ sender: UIButton) {
        generateRandomDices()
    }
    
    @IBAction func normasPressed(_ sender: UIButton) {
        //Ventana de alerta
        let controller = UIAlertController(title: "Normas", message: """
                                    Dividir número de participantes entre 2 y es el número de señores del 3.
                                    Lanzar los dados hasta que salgan tantos 3 como personas sean señores. Estos deben de beber cada vez que salga un 3.
                                    Si no sale nada en la primera tirada, bebes y pasas turno.
                                    7 bebe el de la izquierda y 9 el de la derecha.
                                    11 pones una norma.
                                    8, hay que decir 8 y beber todos. Decir "mierda" al teminar el chupito. El último bebe otra vez.
                                    Números dobles, mandas beber la cantidad del doble.
                                    """, preferredStyle: UIAlertController.Style.alert)
        
        //Botón para cerrar la pantalla.  .cancel - cancelar, .destructive - borrar, .default - aceptar
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        //Se añade la accion
        controller.addAction(action)
        
        show(controller, sender: nil)
    }
    
    func generateRandomDices(){
        //Generacion del numero aleatorio
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            //Animacion de los dados utilizando transformaciones
            self.imageViewDiceLeft.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2).concatenating(CGAffineTransform(translationX: -100, y: 75)).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            self.imageViewDiceRight.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2).concatenating(CGAffineTransform(translationX: 100, y: 75)).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            self.imageViewDiceLeft.alpha = 0.0
            self.imageViewDiceRight.alpha = 0.0
            
        }) { (completed) in
            //Para que la imagen no se quede pequeña
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceLeft.alpha = 1.0
            self.imageViewDiceRight.alpha = 1.0
            
            //Cambio de la imagen
            self.imageViewDiceLeft.image = UIImage(named: self.diceImages[self.randomDiceIndexLeft])
            self.imageViewDiceRight.image = UIImage(named: self.diceImages[self.randomDiceIndexRight])
        }
    }
    
    //Tirar los dados agitadndo el telefono. BecomeFirstResponder es para poder hacerte responsable de algunos eventos al producirse. Agitar, acelerometro
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    //MotionEnded para cuando se ha terminado algún tipo de respuesta externa
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generateRandomDices()
        }
    }
    
}

