//
//  ViewController.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 09/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit

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
        
    }
    
    
}

