//
//  AppelModel.swift
//  finalbato
//
//  Created by Ludus Académie on 13/10/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit
import Foundation
class AppelModel: NSObject {

    //properties
    
    var IDAppel:   String!
    var Description: String!
    var commentaire: String!
    var client: String!
    var statut: String!
    
    
    
    
    
    //empty constructor
    
    override init()
    {
    
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(IDAppel: String, Description: String, commentaire: String, client: String, statut: String) {
        
        self.IDAppel = IDAppel
        self.Description = Description
        self.commentaire = commentaire
        self.client = client
        self.statut = statut
    
    
    
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(IDAppel as Optional), description: \(Description as Optional), commentaire: \(commentaire as Optional), client: \(client as Optional), Statut: \(statut as Optional)"
    }
    
    

}
