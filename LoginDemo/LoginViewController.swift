//
//  ViewController.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 09/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    //MARK:- Properties
    
    
    var username = ""
    var passwordVariable = ""
    var profilePhoto: UIImage? = nil
    
    //MARK:- Outlets

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    
    //MARK:- user Functions
    
    func displayAlert(title: String,displayError: String){
        let alert = UIAlertController(title: title, message: displayError, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
            self.dismiss(animated: true, completion: nil)})
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func clearData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
            let fetchRequeset: NSFetchRequest<SignUp> = SignUp.fetchRequest()
            
            do{
                let users = try(context.fetch(fetchRequeset))
                
                for user in users{
                    context.delete(user)
                }
            }catch let err{
                print(err)
            }
        }
    }
    
    func designView(){
        self.loginButtonOutlet.layer.cornerRadius = 10
        self.signupButtonOutlet.layer.cornerRadius = 10
    }
    
    func logInMethod(){
        var displayError = ""
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
            
            let fetchRequest:NSFetchRequest<SignUp> = SignUp.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "email = %@", email.text!)
            do{
                
                let users = try(context.fetch(fetchRequest))
                
                if users.count > 0{
                    for user in users{
                        if(email.text == user.email && password.text == user.password){
                            print("Login Sucessfully")
                            username = user.firstName!
                            passwordVariable = user.password!
                            profilePhoto = UIImage(data: user.profilePicture as! Data)
                            self.performSegue(withIdentifier: "toMainVCFromLogin", sender: self)
                        }else{
                            displayError = "You have entered Wrong Details Inside User"
                            displayAlert(title: "Wrong Creditials", displayError: displayError)
                            email.text = ""
                            password.text = ""
                        }
                    }
                }else{
                    email.text = ""
                    password.text = ""

                    displayError = "You have entered Wrong Details OutSide"
                    displayAlert(title: "Wrong Creditials", displayError: displayError)
                }
            }catch let err{
                email.text = ""
                password.text = ""
                displayAlert(title: "Error", displayError: err as! String)
            }
        }
    }
    
    //MARK:- View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //clearData()
        designView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Action method
    
    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        var displayError = ""
        if(email.text == ""){
            displayError = "Please Enter Valid Email"
        }else if(password.text == ""){
            displayError = "Please Enter Password"
        }
        
        if displayError != ""{
            displayAlert(title: "Incomplete Form", displayError: displayError)
        }
        
        if(email.text != "" && password.text != ""){
            logInMethod()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainVCFromLogin"{
            let mainVC = segue.destination as! MainViewController
            mainVC.firstName = username
            mainVC.profilePhoto = profilePhoto
        }
    }
}

