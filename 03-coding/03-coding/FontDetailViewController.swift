//
//  FontDetailViewController.swift
//  03-coding
//
//  Created by Sergio on 05/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    var familyName : String = ""
    var fonts : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelTitle.text = familyName
        labelTitle.font = UIFont(name: familyName, size: 16.0)
        
        if fonts.count == 0{
            //Si no hay subfamilias, no se muestra
            pickerView.isHidden = true
        }
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        textView.font = UIFont(name: familyName, size: 13.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func doneButtonPresh(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: metodos del pickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //Es el numero de columnas. La fecha tiene 3 por ejemplo
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    // MARK: UIPickerView delegate metodos
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Cambiando la fuente del texto
        let font = fonts[row]
        textView.font = UIFont(name: font, size: 13.0)
    }
}
