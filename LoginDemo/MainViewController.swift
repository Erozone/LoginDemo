//
//  MainViewController.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 14/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //PROPERTIES
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var gender = ""
    var birthDay = ""
    var profilePhoto:UIImage?
    
    
    //OUTLETS
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var logoutButtonoutlet: UIButton!
    
    func customizeView(){
         profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.width/2
         profilePictureImageView.contentMode = .scaleAspectFill
    //     profilePictureImageView.clipsToBounds = true
         profilePictureImageView.layer.masksToBounds = true
         usernameLabel.layer.cornerRadius = 10
         logoutButtonoutlet.layer.cornerRadius = 10
    }
    
    func loadData(){
        usernameLabel.text = "\(firstName) \(lastName)"
        profilePictureImageView.image = profilePhoto
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toLoginVC", sender: self)
    }
}


