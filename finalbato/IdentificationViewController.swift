//
//  IdentificationViewController.swift
//  finalbato
//
//  Created by Ludus Académie on 26/06/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit
import Foundation

class Global{
    var NomTechnicien = "placeholder"
    var IDTechnicien = "placeholder"
}

let global=Global()


class IdentificationViewController: UIViewController , UITextFieldDelegate, HomeModelProtocol{
    
    let homeModel = HomeModel()
          
    var feedItems: NSArray = NSArray()
//    var selectedTechnicien : TechnicienModel = TechnicienModel()
    
    @IBOutlet weak var hope: UILabel!
    @IBOutlet weak var validationbtn: UIButton!
    @IBOutlet weak var mdptext: UITextField!
    @IBOutlet weak var nametext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  postToServerFunction()
       
  //    homeModel.downloadItems(de: "techniciens")
         homeModel.delegate = self
        mdptext.delegate = self
        nametext.delegate = self
    

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded1(items: NSArray) {
     //   feedItems = itemsCli
    }
    
    internal func itemsDownloaded2(items: NSArray){
        feedItems = items
        
    }
    
    func itemsDownloaded3(items: NSArray) {
       // feedItems = itemsCom
    }
    
    
    
    @IBAction func validation(_ sender: UIButton) {
        var testid = false
        
        let nomtec = nametext.text!
        let mdptec = mdptext.text!
        DispatchQueue.main.async{
            self.homeModel.downloadtechs(de: nomtec, mdp: mdptec)
        }
        DispatchQueue.main.async{
            for i in 0..<self.feedItems.count{
                let item: TechnicienModel = self.feedItems[i] as! TechnicienModel
            
        
            if(item.nom != "false"){
                
                testid=true
                global.NomTechnicien = item.nom!
                global.IDTechnicien = item.IDTechnicien!
            }
        }
        if testid==true{
            self.performSegue(withIdentifier: "IDtoMenu", sender: self)
        }
        else
        {
            let alert = UIAlertController(title: "Erreur d'authentification", message: "Nous n'avons pas pu vous identifier. Veuillez réessayer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            } }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
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
