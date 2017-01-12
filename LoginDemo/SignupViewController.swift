//
//  SignupViewController.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 10/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit
import CoreData

class SignupViewController: UIViewController {

    //MARK:- Outlets
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    func saveData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
           let user = NSEntityDescription.insertNewObject(forEntityName: "SignUp", into: context) as! SignUp
            user.firstName = firstName.text
            user.lastName = lastName.text
            user.email = email.text
            user.password = password.text
            
            delegate?.saveContext()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Actions
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        if(firstName.text == "" || lastName.text == "" || email.text == "" || password.text == ""){
            print("TextField is empty.Please fill all textfield")
        }else{
            saveData()
            print("Data Saved")
            self.performSegue(withIdentifier: "toLogIn", sender: self)
        }
    }
    
    
    @IBAction func toLoginButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toLogIn", sender: self)
    }
    
    
}
