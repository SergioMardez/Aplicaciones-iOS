//
//  ViewController.swift
//  01-iamrich
//
//  Created by Sergio on 02/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Propiedades
    @IBOutlet weak var labelTitle: UITextField!
    @IBOutlet weak var imageViewRuby: UIImageView!
    @IBOutlet weak var buttomPush: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //Metodos
    @IBAction func buttomPressed(_ sender: UIButton) {
        //Ventana de alerta
        let controller = UIAlertController(title: "Soy rico", message: """
                                    Soy rico,
                                    me lo merezco.
                                    Soy bueno,
                                    estoy sano y tengo éxito
                                    """, preferredStyle: UIAlertController.Style.alert)
        
        //Botón para cerrar la pantalla.  .cancel - cancelar, .destructive - borrar, .default - aceptar
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        //Se añade la accion
        controller.addAction(action)
        
        show(controller, sender: nil)
        
        labelTitle.text = "Ya soy rico..."
        
        imageViewRuby.image = UIImage (named: "pepeRico")
        
        buttomPush.setTitle("¿Suficiente riqueza?", for: .normal)
        
    }
    
}

