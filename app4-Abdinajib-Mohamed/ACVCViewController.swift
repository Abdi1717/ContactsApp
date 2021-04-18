//
//  ACVCViewController.swift
//  app4-Abdinajib-Mohamed
//
//  Created by Abdinajib Mohamed on 2/26/21.
//

//import Foundation

import UIKit


protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

 class ACVCViewController: UITableViewController {
    weak var delegate: AddContactDelegate?
    
   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if createNewContact() != nil {
            self.delegate?.didCreate(createNewContact()!)
        }
        dump(createNewContact())
            
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    

    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var Company: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var PhoneNumber: UITextField!
    
    func createNewContact() -> Contact? {
       
        if  FirstName.text == nil || LastName.text == nil || Company.text == nil ||  Email.text == nil || PhoneNumber.text == nil {
          return  nil
        }
        
        else {
            return  Contact(firstName: FirstName.text! ,lastName: LastName.text!,company:Company.text! , email: Email.text!, phoneNumber: PhoneNumber.text!)
        }
        
           /* return  Contact(firstName: FirstName.text ?? "Optional" ,lastName: LastName.text ?? "Optional",company:Company.text ?? "Optional", email: Email.text ?? "Optional", phoneNumber: PhoneNumber.text ?? "Optional")
            */
            
    }
    
   
    
 }

