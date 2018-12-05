//
//  ThirdViewController.swift
//  03-coding
//
//  Created by Sergio on 04/12/2018.
//  Copyright © 2018 SergioInc. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var families : [String] = []
    //Diccionario de fuentes
    var fonts : [String: [String]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Para ordenar las familias en orden ascendente. Mostrar orden alfabetico
        families = UIFont.familyNames.sorted(by: {return $0 < $1})
        /*
        Lo anterior es lo mismo que:
             families = UIFont.familyNames
             families = UIFont.familyNames.sorted{ (s1, s2) -> bool in
                return s1 < s2}
         */
        
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowFontsforFamily" {
            //Para hacer el segue hay que tener en cuenta el viewController que hay en medio
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetailViewController
            
            //Se pasan los datos
            let idx = tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = families[idx]
            destinationVC.fonts = fonts[families[idx]]!
        }
    }
    
    //MARK: Metodos del protocolo UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Numero de filas en cada seccion
        return families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontFamilyCell", for: indexPath)
        cell.textLabel?.text = families[indexPath.row]
        cell.textLabel?.font = UIFont(name: families[indexPath.row], size: 20.0)
        
        return cell
    }
    
    
    //MARK: Metodos del protocolo UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fonFamily = families[row]
        let familyFonts = fonts[fonFamily]!
    }

}
