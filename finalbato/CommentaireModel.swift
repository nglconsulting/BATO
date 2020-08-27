//
//  CommentaireModel.swift
//  finalbato
//
//  Created by Ludus Académie on 07/11/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit
import Foundation

class CommentaireModel: NSObject {
    //properties
    
    var Nom_Technicien:   String?
    var TexteCommentaire: String?
    var IDClient: String?
    var photo: String?
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(Nom_Technicien: String, mdpt: String, ID_Client: String) {
        
        self.Nom_Technicien = Nom_Technicien
        self.TexteCommentaire = mdpt
        self.IDClient = ID_Client
        
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "nom: \(Nom_Technicien as Optional), TEXTE: \(TexteCommentaire as Optional), nom: \(IDClient as Optional) , photo:\(photo as Optional) "
        
    }
    
}
