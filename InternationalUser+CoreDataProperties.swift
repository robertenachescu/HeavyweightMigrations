//
//  InternationalUser+CoreDataProperties.swift
//  HeavyweightMigration
//
//  Created by Robert Enachescu on 23.03.2021.
//
//

import Foundation
import CoreData


extension InternationalUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InternationalUser> {
        return NSFetchRequest<InternationalUser>(entityName: "InternationalUser")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userAge: Int16
    @NSManaged public var userCountry: String?
    @NSManaged public var userSex: String?

}

extension InternationalUser : Identifiable {

}
