//
//  ChantierInter.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit

class ChantierInter: UIViewController {
    var IDChantier = "placeholder"
    var future = "placeholder"

    override func viewDidLoad() {
        super.viewDidLoad()
        print(IDChantier)

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func AU(_ sender: UIButton) {
        future = "0"
        
    }
    
    
    @IBAction func AD(_ sender: UIButton) {
        future = "1"
    }
    @IBAction func VU(_ sender: UIButton) {
        future = "0"
    }
    @IBAction func VD(_ sender: UIButton) {
        future = "1"
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let VC = segue.destination as? Materiaux {
            
            
            VC.future = future
            VC.IDChantier = IDChantier
            
            
        }
        else if let VC = segue.destination as? MateriauxRec{
             VC.future = future
            VC.IDChantier = IDChantier 
        }
    }
    

}
