//
//  DevisModel.swift
//  finalbato
//
//  Created by Ludus Académie on 04/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import Foundation

class DevisModel: NSObject {
    
    var IDDevis:   String!
    var PDF: String!
    var commentaire: String!
    var NomClient: String!
    
    
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(IDChantier: String, Libelle: String, Statut: String) {
        
        
        
        
        
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \( IDDevis as Optional), Image: \(PDF as Optional), Statut: \(commentaire as Optional), NomClient: \(NomClient as Optional)"
    }
    
    
    
}
