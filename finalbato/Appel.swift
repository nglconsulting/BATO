//
//  Appel.swift
//  finalbato
//
//  Created by Ludus Académie on 09/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

//TODO UITableView refresh



class Appel: UIViewController , UITableViewDataSource, UITableViewDelegate, HomeModelProtocol{
    
    
    var feedItems: NSArray = NSArray()
    var feedItems2: NSArray = NSArray()
    var techniciens = [Techniciens_appelModel]()

    var selectedAppel : AppelModel = AppelModel()
    
    var Appels = [AppelModel]()
    var searchedAppel = [AppelModel]()
    
    var searching = false
    
    var onfirst = true
    
    let myGroup = DispatchGroup()
    
    //  @IBOutlet weak var Commentlbl: UITextField!
    
     @IBOutlet weak var AppelTableView: UITableView!
     
    
  //  @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let homeModel = HomeModel()
    
    let homeModel2 = HomeModel()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.delegate = self
        
       
        searchedAppel.removeAll()
        
        
        
        self.AppelTableView.estimatedRowHeight = 40;
        self.AppelTableView.rowHeight = UITableViewAutomaticDimension;
        
        AppelTableView.delegate = self
        AppelTableView.dataSource = self
        
        homeModel.delegate = self
        homeModel.downloadItems(de: "appel")
       
        
       
        homeModel2.delegate = self
        homeModel2.downloadItems(de: "techniciens_appel")
       
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func itemsDownloaded1(items: NSArray) {
        
        
        feedItems = items
        
       
        for ap in feedItems{
            
            
            Appels.append((ap as? AppelModel)!)
            
        }
        
        
       
        
        
        self.AppelTableView.reloadData()
        
        
        
        
        
        
    }
    
    func itemsDownloaded3(items: NSArray){
        
        
        
        
        
    }
    //on remplit la liste de techniciens, pour savoir qui travaille sur quoi
    func itemsDownloaded2(items: NSArray) {
        feedItems2 = items
        techniciens.removeAll()
        for tech in feedItems2{
            
            techniciens.append((tech as? Techniciens_appelModel)!)
            
        }
        print(techniciens)
        if(!onfirst){
         myGroup.leave()
        }
        else{
            onfirst = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching==false{
            return feedItems.count
        }
        else
        {
            print(searchedAppel.count)
            return searchedAppel.count
        }
        
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the location to be shown
        
        //
        super.viewDidLoad()
        var item: AppelModel
        if searching == false {
            item = feedItems[indexPath.row] as! AppelModel
        }
        else{
            item = searchedAppel[indexPath.row]
        }
        let AppelCell = AppelTableView.dequeueReusableCell(withIdentifier: "Appelcell") as! AppelTableViewCell
        
   
        AppelCell.Workbtn.setTitle("Interagir", for: .normal)
        
        //on remplit les noms avec les bons champs
        AppelCell.IDAppellbl.text = item.IDAppel 
        AppelCell.Descriptionlbl.text = item.Description
        AppelCell.Devislbl.text = item.commentaire
        
        //on change le texte et la couleur du statut en fonction de son code
        AppelCell.Statutlbl.text = item.statut
        if AppelCell.Statutlbl.text == "2"{
            AppelCell.Statutlbl.text = "En cours"
            AppelCell.Statutlbl.textColor = .orange
        }
        else if AppelCell.Statutlbl.text == "1"{
            AppelCell.Statutlbl.text = "Pas commencé"
            AppelCell.Statutlbl.textColor = .red
        }
        else {
            AppelCell.Statutlbl.text = "Terminé"
            AppelCell.Statutlbl.textColor = .green
        }
      
        AppelCell.Clientlbl.text = "Nom du client:" + item.client
        
        //on regarde dans la liste des techniciens si y'a bien qqun qui travaille
        //dessus, si oui on le rajoute dans la variable str
        
        
        for tech in techniciens{
            
            if (tech.IDAppel == item.IDAppel){
                
                AppelCell.str +=   tech.Nom + ","
            }
           
            
        }
       
        if (AppelCell.str == ""){
            AppelCell.str="Personne ne travaille dessus"
            AppelCell.lbl.textColor = .red
        }
        else{
            AppelCell.lbl.textColor = .black
            AppelCell.str += " travaillent dessus en ce moment"
        }
        //on met str dans le label
        AppelCell.lbl.text = AppelCell.str
        
        //on regle les propriétés du label déclaré programmaticalement
        AppelCell.lbl.frame = CGRect(x: AppelCell.Statutlbl.frame.maxX + 20, y: AppelCell.Statutlbl.frame.maxY, width: 230, height: 21)
        AppelCell.lbl.textAlignment = .center //For center alignment
        
        
        
        AppelCell.lbl.numberOfLines = 2
        AppelCell.lbl.lineBreakMode = .byCharWrapping
        AppelCell.lbl.sizeToFit()//If required
        //on rajoute le label dans la vue
        AppelCell.contentView.addSubview(AppelCell.lbl)
        //on appelle la closure du bouton (c'est à dire le code contenu dedans)
        AppelCell.WorkButtonAction = { [unowned self] in
            if (global.NomTechnicien != "placeholder"){
            var WorkOn = false
            for tech in self.techniciens{
                if ((tech.IDTechnicien==global.IDTechnicien) && (item.IDAppel==tech.IDAppel)){
                   WorkOn = true
                    break
                }
            }
            
            if WorkOn {
            let alert = UIAlertController(title: "Validation", message: "Etes-vous sûr de vouloir arrêter de bosser dessus?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Oui", style: .default, handler:{ action in
                print("ok on suppr")
                self.uploading(to: "work_on_cancel",IDApp: AppelCell.IDAppellbl.text!, IDTech: global.IDTechnicien)
            
            })
                
            alert.addAction(ok)
                let non = (UIAlertAction(title: "Non", style: .cancel, handler: { action in
                  print("annulé")
                
                }))
            alert.addAction(non)
            self.present(alert, animated: true, completion: nil)
            
            }else{
                
                let alert = UIAlertController(title: "Validation", message: "Etes-vous sûr de vouloir bosser dessus?", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Oui", style: .default, handler:{ action in
                    print("ok on ajoute")
                    self.uploading(to: "work_on",IDApp: AppelCell.IDAppellbl.text!, IDTech: global.IDTechnicien)
                    
                })
                
                alert.addAction(ok)
                let non = (UIAlertAction(title: "Non", style: .cancel, handler: { action in
                    print("annulé")
                    
                }))
                alert.addAction(non)
                self.present(alert, animated: true, completion: nil)
            }
            
            
         
           
            } }
        return AppelCell
        
    }
    
   
    
    
    func alert(_ title: String, message: String)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Oui", style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func uploading(to: String, IDApp: String, IDTech: String){
        self.showSpinner(onView: self.view)
        myGroup.enter() //travail d'upload
        let upload = Upload()
        upload.u2(vers: to, message: IDApp, de: IDTech, sur: "rien", image: nil)
        //on retelecharge les techniciens mis à jour
        self.homeModel2.downloadItems(de: "techniciens_appel")
        
        myGroup.notify(queue: .main) {
        self.AppelTableView.reloadData()
         
            //self.viewDidLoad()
            
            self.removeSpinner()
            self.AppelTableView.reloadData()
        
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    // MARK: - Private instance methods
    
    // MARK: - Private instance methods
    
    
    
    
    // MARK: - Navigation
    //TODO
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let VC = segue.destination as? Commentaires {
            
            
            let Index = AppelTableView.indexPathForSelectedRow?.row
            let item: AppelModel = feedItems[Index!] as! AppelModel
            VC.IDClient = item.IDAppel! //ca devrait être vcidappel mais jai pas changé
            VC.delavue = "appel"
            //  print(Index)
            
        }
    }
    
    @IBAction func On_workbtn_click(_ sender: UIButton) {
    //    alert("test", message: "coucou")
        
     //   let ap = AppelTableViewCell()
      //  print(ap.IDAppellbl.text)
       // ap.Workbtn2()
      //  let upload = Upload()
       // upload.u(vc: self, vers: "work_on", message: )
    }
    
}

extension Appel: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchedAppel = Appels.filter{
            
            
            $0.IDAppel.prefix(searchText.count) == searchText
            
        }
        
        
        
        searching = true
        AppelTableView.reloadData()
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        AppelTableView.reloadData()
    }
}



