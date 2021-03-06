//
//  SignUp+CoreDataProperties.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 14/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//

import Foundation
import CoreData


extension SignUp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SignUp> {
        return NSFetchRequest<SignUp>(entityName: "SignUp");
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var gender: String?
    @NSManaged public var birthday: String?
    @NSManaged public var profilePicture: NSData?

}
