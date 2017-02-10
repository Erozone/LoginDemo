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
        
//        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.height/2
//        profilePictureImageView.clipsToBounds = true
//        profilePictureImageView.layer.masksToBounds = true
        
        profilePictureImageView.layer.borderWidth = 1
        profilePictureImageView.layer.masksToBounds = false
        profilePictureImageView.layer.borderColor = UIColor.black.cgColor
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height/2
        profilePictureImageView.clipsToBounds = true
    }
    
    func loadData(){
        usernameLabel.text = "\(firstName) \(lastName)"
        print(usernameLabel.text!)
        profilePictureImageView.image = profilePhoto
        profilePictureImageView.contentMode = .scaleAspectFill
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        customizeView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toLoginVC", sender: self)
    }
}


