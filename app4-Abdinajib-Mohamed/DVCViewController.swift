//
//  DVCViewController.swift
//  app4-Abdinajib-Mohamed
//
//  Created by Abdinajib Mohamed on 2/26/21.
//

//import Foundation
import UIKit

class DVCViewController: UITableViewController {
    var name = ""
    var company = ""
    var Email = ""
    var phoneNumber = ""
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var CompanyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        CompanyLabel.text = company
        PhoneNumberLabel.text = phoneNumber
        NameLabel.text = name
        EmailLabel.text = Email
    }
    
    
}
