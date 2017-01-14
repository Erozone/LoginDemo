//
//  ContinueViewController.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 14/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import UIKit
import CoreData

class ContinueViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    //Properties
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var gender = "male"
    var birthDay = ""
    var profilePhoto: NSData?
    
    
    //OUTLETS
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var bdayTextField: UITextField!
    @IBOutlet weak var bdayLabel: UILabel!
    @IBOutlet weak var chooseProPicButton: UIButton!
    @IBOutlet weak var ProPicImageView: UIImageView!
    
    //Picks the select image and set it to imageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            ProPicImageView.image = pickedImage
            ProPicImageView.layer.cornerRadius = ProPicImageView.frame.size.width/2
            ProPicImageView.clipsToBounds = true
            profilePhoto = UIImageJPEGRepresentation(pickedImage, 1) as NSData?
        }
        
    }
    
    //Save Data to coredata
    func saveData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "SignUp", into: context) as! SignUp
            newUser.firstName = firstName
            newUser.lastName = lastName
            newUser.email = email
            newUser.password = password
            newUser.gender = gender
            newUser.birthday = birthDay
            newUser.profilePicture = profilePhoto
            
            delegate?.saveContext()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bdayTextField.keyboardType = UIKeyboardType.phonePad
        femaleButton.isHighlighted = true
        
        
    }
    
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        
        gender = "male"
        maleButton.isHighlighted = false
        femaleButton.isHighlighted = true
        
    }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        
        gender = "female"
        maleButton.isHighlighted = true
        femaleButton.isHighlighted = false
        
    }
    
    
    @IBAction func signupUser(_ sender: UIButton) {
        saveData()
        print("Data Saved!!")
        performSegue(withIdentifier: "toMainVCFromSignUp", sender: self)
    }


    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if bdayTextField.text!.characters.count == 2{
            bdayTextField.text =  bdayTextField.text! + "/"
        }
        if bdayTextField.text!.characters.count == 5{
            bdayTextField.text = bdayTextField.text! + "/"
        }
    }
    
    
    
    @IBAction func chooseProfilePicture(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true, completion: nil)
        
    }
    
}
