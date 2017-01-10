//
//  SignupViewController.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 10/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Actions
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func toLoginButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toLogIn", sender: self)
    }
    
    
}
