//
//  Menu.swift
//  finalbato
//
//  Created by Ludus Académie on 09/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit



class Menu: UIViewController {
    
    
    @IBOutlet weak var LblNomTech: UILabel!
    @IBOutlet weak var SideMenuConstraint: NSLayoutConstraint!
    @IBOutlet var texttest: UITextField!
    
    var IsSlideMenuHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LblNomTech.text = global.NomTechnicien
        SideMenuConstraint.constant = -140
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
       // let destinationvc=segue.destination as? Appel
     //   destinationvc?.texttodisplay=(texttest.text)!
    } */
    
    @IBAction func MenuBtnPressed(_ sender: UIBarButtonItem) {
        if IsSlideMenuHidden {
            SideMenuConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations:{
            self.view.layoutIfNeeded()
                  })
        }
        else {
        SideMenuConstraint.constant = -140
            UIView.animate(withDuration: 0.3, animations:{
                self.view.layoutIfNeeded()
            })
    }
        
    IsSlideMenuHidden = !IsSlideMenuHidden
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
