//
//  Chantier.swift
//  finalbato
//
//  Created by Ludus Académie on 22/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class Chantier: UIViewController,UITableViewDataSource, UITableViewDelegate, HomeModelProtocol{
    //Variables
    var feedItems: NSArray = NSArray()
    var selectedChantier : ChantierModel = ChantierModel()
    
    var Chantiers = [ChantierModel]()
    var searchedChantier = [ChantierModel]()
    
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var ChantierTableView: UITableView!
    
    
    func itemsDownloaded1(items: NSArray) {
        feedItems = items
        
       
        for cha in feedItems{
            
            
            Chantiers.append((cha as? ChantierModel)!)
            
        }
        
        
        
        
        
        self.ChantierTableView.reloadData()
        
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
            return searchedChantier.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: ChantierModel
        if searching == false {
            item = feedItems[indexPath.row] as! ChantierModel
        }
        else{
            item = searchedChantier[indexPath.row]
        }
        let ChantierCell = ChantierTableView.dequeueReusableCell(withIdentifier: "chantiercell") as! ChantierTableViewCell
        
        for lbl in ChantierCell.LabelCollection{
            
            switch(lbl.tag){
            case 0:
                lbl.text = item.IDChantier
            case 1:
                lbl.text = item.Libelle
            
            case 2:
                lbl.text = item.NomClient
                
            case 3:
                lbl.text = item.DateDebut
                
            case 4:
                lbl.text = item.DateFin
            
            case 5:
                var st = ""
                if(item.Statut=="1"){
                    st = "Non commencé"
                }
                else if(item.Statut=="2"){
                    st="En cours"
                }
                else{
                    st = "Terminé"
                }
                lbl.text = st
                
             default:
                print("default")
                
            }
           
        }
        
        
        
        
        
        
        return ChantierCell
        
    }
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        self.ChantierTableView.estimatedRowHeight = 40;
        self.ChantierTableView.rowHeight = UITableViewAutomaticDimension;
        
        ChantierTableView.delegate = self
        ChantierTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems(de: "chantier")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? ChantierInter {
            
            
            let Index = ChantierTableView.indexPathForSelectedRow?.row
            let item: ChantierModel = feedItems[Index!] as! ChantierModel
            VC.IDChantier = item.IDChantier!
            
            
        }
    }
    

}

extension Chantier: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchedChantier = Chantiers.filter{
            
            
            $0.IDChantier.prefix(searchText.count) == searchText
            
        }
        
        
        
        searching = true
        self.ChantierTableView.reloadData()
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.ChantierTableView.reloadData()
    }
}
