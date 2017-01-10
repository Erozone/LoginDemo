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
    
    
    var user : [SignUp] = []
    
    
    func designView(){
        self.loginButtonOutlet.layer.cornerRadius = 10
        self.signupButtonOutlet.layer.cornerRadius = 10
    }
    
    func logInMethod(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SignUp")
            do{
//                user = try(context.execute(fetchRequest))
                
                if (user[0].email == email.text) && (user[0].password == password.text){
                    print("Login Sucessfully")
                }else{
                    print("Wrong Credetial")
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

