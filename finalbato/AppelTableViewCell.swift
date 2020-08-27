//
//  AppelTableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 22/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class AppelTableViewCell: UITableViewCell {

    
    @IBOutlet weak var IDAppellbl: UILabel!
    
    
    @IBOutlet weak var Descriptionlbl: UILabel!
    
    
    @IBOutlet weak var Clientlbl: UILabel!
    
    
    @IBOutlet weak var Devislbl: UILabel!
    
    @IBOutlet weak var Statutlbl: UILabel!
    
    var lbl = UILabel()
    var str = String()
    
    
     var WorkButtonAction : (() -> ())?
    
    
    
   

    @IBOutlet weak var Workbtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     @IBAction   func Workbtn2() {
        WorkButtonAction?()
        
        /*  let upload = Upload()
         upload.u2(vers: "work_on", message: IDAppellbl.text!, de: global.IDTechnicien, sur: "rien", image: nil)
        print(global.IDTechnicien)
        print(IDAppellbl.text!)*/
    }
    
    override func prepareForReuse() {
        // invoke superclass implementation
        super.prepareForReuse()
        self.lbl.text = nil
        self.str = ""
        
        
        
    }
   
    
}
