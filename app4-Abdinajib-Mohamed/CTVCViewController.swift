//
//  CTVCViewController.swift
//  app4-Abdinajib-Mohamed
//
//  Created by Abdinajib Mohamed on 2/26/21.
//

//import Foundation

import UIKit

class CTVCViewController: UITableViewController, AddContactDelegate {
    
    
    var contacts = [Contact]()
    var nameCTVC = ""
    var companyCTVC = ""
    var EmailCTVC = ""
    var phoneNumberCTVC = ""
    
    func didCreate(_ contact: Contact) {
      let vc = ACVCViewController()
        
        vc.dismiss(animated: true, completion: nil)
        navigationController?.dismiss(animated: true, completion: nil)
        contacts.append(contact)
        
        contacts = contacts.sorted(by: { $0.lastName < $1.lastName })
        
        self.tableView.reloadData()
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        contacts.append(Contact(firstName: "Abdi",lastName: "M",company:"UPenn" , email: "abdim@seas.upenn.edu", phoneNumber: "6515295555" ))
        contacts.append(Contact(firstName: "John",lastName: "H",company:"UPenn" , email: "Johnh@seas.upenn.edu", phoneNumber: "6129255555" ))
    }
    
    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        
       /*
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
       // cell.textLabel?.text = newsItems[indexPath.row].name
        if let label = cell.viewWithTag(5) as?  UILabel { label.text = newsItems[indexPath.row].name}
        */
       
        
        //let newIteamVeed = newsItems[indexPath.row]
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    
       
        
        if let label = cell.viewWithTag(5) as?  UILabel { label.text = "\(contacts[indexPath.row].firstName), \(contacts[indexPath.row].lastName)"}
        
        
        
        return (cell)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        nameCTVC = "\(contacts[indexPath.row].firstName), \(contacts[indexPath.row].lastName)"
        EmailCTVC =  contacts[indexPath.row].email
        companyCTVC = contacts[indexPath.row].company
        phoneNumberCTVC = contacts[indexPath.row].phoneNumber
        self.performSegue(withIdentifier: "CTVCToDVCShow", sender: self)
        
       
        
     
      
      
        //print("New:\(newsItems[indexPath.row].favorite)")
       
        //tableView.refreshControl
        
        self.tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           // get a reference to the second view controller
        if let secondViewController = segue.destination as? DVCViewController {
            
            secondViewController.name = nameCTVC
            secondViewController.Email = EmailCTVC
            secondViewController.company = companyCTVC
            secondViewController.phoneNumber = phoneNumberCTVC
            
            
        }
        
     if let thirdViewController = segue.destination as? ACVCViewController {
        
        thirdViewController.delegate = self
     
     }
           // set a variable in the second view controller with the data to pass
          // secondViewController.receivedData = "hello"
       }
  
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        
    }
    

}


    
    

