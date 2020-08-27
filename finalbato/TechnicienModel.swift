//
//  TechnicienModel.swift
//  finalbato
//
//  Created by Ludus Académie on 23/08/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//


import UIKit
import Foundation

class TechnicienModel: NSObject {
    //properties
    
    var nom:   String?
    var mdp: String?
    var IDTechnicien: String?
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(Nom_Technicien: String, mdpt: String, idt: String) {
        
        self.nom = Nom_Technicien
        self.mdp = mdpt
        self.IDTechnicien = idt
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "nom: \(nom as Optional), mdp: \(mdp as Optional) , ID: \(IDTechnicien as Optional)"
        
    }
    
}
