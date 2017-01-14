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
    
    //Alert View
    
    func displayAlert(title: String,displayError: String){
        let alert = UIAlertController(title: title, message: displayError, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
            self.dismiss(animated: true, completion: nil)})
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
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
            let displayError = "TextField is empty.Please fill all textfield"
            
        }else{
            //saveData()
            //print("Data Saved")
            self.performSegue(withIdentifier: "continueSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continueSegue"{
            let addUserInfoVC = segue.destination as! ContinueViewController
            addUserInfoVC.firstName = firstName.text!
            addUserInfoVC.lastName = lastName.text!
            addUserInfoVC.email = email.text!
            addUserInfoVC.password = password.text!
        }
    }
    
    
    @IBAction func toLoginButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toLogIn", sender: self)
    }
    
    
}
