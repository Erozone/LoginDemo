//
//  SignUp+CoreDataProperties.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 10/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension SignUp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SignUp> {
        return NSFetchRequest<SignUp>(entityName: "SignUp");
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}
