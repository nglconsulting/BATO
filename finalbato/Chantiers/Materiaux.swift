//
//  Materiaux.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit

class Materiaux: UIViewController , UITableViewDataSource, UITableViewDelegate, HomeModelProtocol{
    
   
    
    var IDChantier = "placeholder"
    var future = "placeholder"
    
    
    var feedItems: NSArray = NSArray()
    var selectedMateriau : MateriauModel = MateriauModel()
    
    var Materiaux = [MateriauModel]()
    var searchedMateriau = [MateriauModel]()
    
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var MateriauxTableView: UITableView!
    
    func itemsDownloaded1(items: NSArray) {
        feedItems = items
        
        
        for mat in feedItems{
            
            
            Materiaux.append((mat as? MateriauModel)!)
            
        }
        
        
        
        
        
        self.MateriauxTableView.reloadData()
    }
    
    func itemsDownloaded2(items: NSArray) {
        
    }
    
    func itemsDownloaded3(items: NSArray) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching==false{
            return feedItems.count
        }
        else
        {
            return searchedMateriau.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: MateriauModel
        if searching == false {
            item = feedItems[indexPath.row] as! MateriauModel
        }
        else{
            item = searchedMateriau[indexPath.row]
        }
        let MateriauCell = MateriauxTableView.dequeueReusableCell(withIdentifier: "materiaucell") as! MateriauxTableViewCell
        
        MateriauCell.IDMateriaulbl.text = item.IDMateriau
        MateriauCell.Libellelbl.text = item.Intitule
        MateriauCell.Qtetxtf.text = "0"
        //clic du stepper
        MateriauCell.StepperAction = { [unowned self] in
            MateriauCell.Qtetxtf.text = String(Int(MateriauCell.Stepper.value))
            
        }
        //clic du bouton d'envoi
        MateriauCell.SendBtnAction  = { [unowned self] in
            
            let alert = UIAlertController(title: "Validation", message: "Voulez vous ajouter cet outil à votre liste?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Oui", style: .default, handler:{ action in
                print("ok on upload")
                self.uploading(to: "materiauxrec", IDMat: item.IDMateriau, Qte: MateriauCell.Qtetxtf.text!, IDTech: global.IDTechnicien, futur: self.future, Chantier: self.IDChantier)
                
            })
            
            alert.addAction(ok)
            let non = (UIAlertAction(title: "Non", style: .cancel, handler: { action in
                print("annulé")
                
            }))
            alert.addAction(non)
            self.present(alert, animated: true, completion: nil)
            
           
        }
        
        
        
        
        return MateriauCell
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.delegate = self
        
        self.MateriauxTableView.estimatedRowHeight = 40;
        self.MateriauxTableView.rowHeight = UITableViewAutomaticDimension;
        
        MateriauxTableView.delegate = self
        MateriauxTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems(de: "materiaux")
        

        // Do any additional setup after loading the view.
    }
    
    func uploading(to: String, IDMat: String, Qte: String, IDTech: String, futur: String, Chantier: String){
        
        let upload = Upload()
        upload.u3(vers: to, message: IDMat, de: Qte, sur: futur, de: IDTech, surchantier: Chantier)
        self.showSpinner(onView: self.view)
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            self.viewDidLoad()
            self.removeSpinner()
        }
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Materiaux: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchedMateriau = Materiaux.filter{
            
            
            $0.IDMateriau.prefix(searchText.count) == searchText
            
        }
        
        
        
        searching = true
        self.MateriauxTableView.reloadData()
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.MateriauxTableView.reloadData()
    }
}
