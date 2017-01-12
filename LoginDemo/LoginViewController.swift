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

    //MARK:- Outlets

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    
    
    
    func designView(){
        self.loginButtonOutlet.layer.cornerRadius = 10
        self.signupButtonOutlet.layer.cornerRadius = 10
    }
    
    func logInMethod(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
            
            let fetchRequest:NSFetchRequest<SignUp> = SignUp.fetchRequest()

            do{
                
                let users = try(context.fetch(fetchRequest))
                
                for user in users{
                    if (user.email == email.text) && (user.password == password.text){
                        print("Login Sucessfully")
                        email.text = ""
                        password.text = ""
                    }else{
                        print("Wrong Credetial")
                    }
                    //break
                }
            }catch let err{
                print(err)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        if(email.text != "") && (password.text != ""){
            logInMethod()
        }else{
            print("Please Fill Both Textfield")
        }
    }
    
    
}

