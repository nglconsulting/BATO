//
//  SAV.swift
//  finalbato
//
//  Created by Ludus Académie on 09/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit





class SAV: UIViewController , UITableViewDataSource, UITableViewDelegate, HomeModelProtocol{
   
    
    var feedItems: NSArray = NSArray()
   // var feedItems2: NSArray = NSArray()
    var selectedClient : ClientModel = ClientModel()
    
    var Clients = [ClientModel]()
    var searchedClient = [ClientModel]()
    
    var searching = false
    
  //  @IBOutlet weak var Commentlbl: UITextField!
    
    @IBOutlet weak var SAVTableView: UITableView!
  
    
    
    @IBOutlet weak var searchBar: UISearchBar!

    
     let searchController = UISearchController(searchResultsController: nil)
    
    
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.delegate = self
        
       
        
      
        
        
        self.SAVTableView.estimatedRowHeight = 40;
        self.SAVTableView.rowHeight = UITableViewAutomaticDimension;

        SAVTableView.delegate = self
        SAVTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems(de: "client")
        
  /*     let homeModel2 = Commentaire()
        homeModel2.delegate = self
        homeModel2.downloadItemsCommentaire()
        
        
      */
       
    
 
        
        
        // Do any additional setup after loading the view.
    }
    
    func itemsDownloaded1(items: NSArray) {
      
       
        feedItems = items
     
      
        for cli in feedItems{
            
            
            Clients.append((cli as? ClientModel)!)
            
        }
         //print(testcli[0])
      
        
        
       
        self.SAVTableView.reloadData()
       
        
   
        
       
        
    }
    
    func itemsDownloaded3(items: NSArray){
    
       
     
        
        
    }
    
    func itemsDownloaded2(items: NSArray) {
       
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
            return searchedClient.count
        }
       
        
       
    }
    
    
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the location to be shown
      
    //
        super.viewDidLoad()
        var item: ClientModel
        if searching == false {
             item = feedItems[indexPath.row] as! ClientModel
        }
        else{
             item = searchedClient[indexPath.row]
        }
            let SAVCell = SAVTableView.dequeueReusableCell(withIdentifier: "SAVcell") as! SAVTableViewCell
        
        
        
       // SAVCell.Clientlbl.text = "\(feedItems[indexPath.row])"
        SAVCell.Devislbl.text = item.Mail
        SAVCell.Chantierlbl.text = item.addresse
        SAVCell.Clientlbl.text = item.IDClient
        SAVCell.Nomlbl.text = item.nom
        
       
        print(item)
      
     
        return SAVCell
        
    }
    
    
   
    func alert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
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
        
            
           let Index = SAVTableView.indexPathForSelectedRow?.row
           let item: ClientModel = feedItems[Index!] as! ClientModel
           VC.IDClient = item.IDClient!
          //  print(Index)
        
        }
    }
    

}

extension SAV: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        searchedClient = Clients.filter{
            
           
            $0.nom.prefix(searchText.count) == searchText
            
        }
        
       
        
        searching = true
        SAVTableView.reloadData()
    
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        SAVTableView.reloadData()
    }
}


