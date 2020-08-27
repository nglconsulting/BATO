//
//  SAVTableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 14/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class SAVTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Nomlbl: UILabel!
    @IBOutlet weak var Btndevis: UIButton!
    @IBOutlet weak var Chantierlbl: UILabel!
    @IBOutlet weak var Clientlbl: UILabel!
    @IBOutlet weak var Devislbl: UILabel!
   
    @IBOutlet weak var Commenttextfield: UITextField!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
    @IBAction func Btncomment(_ sender: UIButton) {
    //    let uploadcomment = Upload()
  //      let uploadtest = Upload()
        
       
    /*    uploadtest.u2(vers: "commentaire",message: Commenttextfield.text!, de: "60",sur: Clientlbl.text!)
       
        print(Devislbl.text as Any)
        
       */
        
       // uploadcomment.u(vc: presentedViewController!, vers: "commentaire", message: Commentlbl.text! )
    }
    
    
}



    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
  /*      if let VC = segue.destination as? Commentaires
        {
           
            
        }
       */
    }
  

