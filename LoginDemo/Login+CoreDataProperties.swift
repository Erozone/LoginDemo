//
//  Login+CoreDataProperties.swift
//  LoginDemo
//
//  Created by Mohit Kumar on 10/01/17.
//  Copyright © 2017 Mohit Kumar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Login {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Login> {
        return NSFetchRequest<Login>(entityName: "Login");
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
