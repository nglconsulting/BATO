//
//  Techniciens_appelModel.swift
//  finalbato
//
//  Created by Ludus Académie on 22/11/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit

class Techniciens_appelModel: NSObject {
    
    var IDAppel:   String!
    var IDTechnicien: String!
    var Nom: String!
    
    
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(IDAppel: String, IDTechnicien: String, nom: String) {
        
        self.IDAppel = IDAppel
        self.IDTechnicien = IDTechnicien
        self.Nom = nom
        
        
        
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(IDAppel as Optional), IDTechnicien: \(IDTechnicien as Optional), Nom: \(Nom as Optional)"
    }
    
    

}
