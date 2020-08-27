//
//  test.swift
//  finalbato
//
//  Created by Ludus Académie on 03/06/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class test: UIViewController {

    @IBOutlet weak var IDfield: UITextField!
    @IBOutlet weak var NameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func testbutton(_ sender: UIButton) {
        
        let uploadtest = Upload()
        
       // uploadtest.u(vc: self, vers: "techniciens",message: IDfield.text!)
        uploadtest.u(vc: self,vers: "techniciens",message: IDfield.text!)
        uploadtest.u(vc: self,vers: "commentaire",message: IDfield.text!)
        
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
