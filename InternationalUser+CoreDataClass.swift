//
//  InternationalUser+CoreDataClass.swift
//  HeavyweightMigration
//
//  Created by Robert Enachescu on 23.03.2021.
//
//

import Foundation
import CoreData

@objc(InternationalUser)
public class InternationalUser: NSManagedObject {

}

extension InternationalUser {
    
    static func saveUserWith(ageOf age: Int, name: String, country: Country, sex: Gender) {
        let newUser: InternationalUser = InternationalUser(context: PersistenceService.sharedInstance.context)
        
        newUser.userAge = Int16(age)
        newUser.userName = name
        
        switch country {
        case .Romania:
            newUser.userCountry = Country.Romania.rawValue
        case .Colombia:
            newUser.userCountry = Country.Colombia.rawValue
        default:
            newUser.userCountry = Country.World.rawValue
        }
        
        switch sex {
        case .Male:
            newUser.userSex = Gender.Male.rawValue
        case .Female:
            newUser.userSex = Gender.Female.rawValue
        default:
            newUser.userSex = Gender.PreferNotToSay.rawValue
        }
        
        PersistenceService.sharedInstance.saveContext()
    }
    
    static func getAllUsers() -> [InternationalUser] {
        let usersRequest: NSFetchRequest<InternationalUser> = InternationalUser.fetchRequest()
        usersRequest.sortDescriptors = [NSSortDescriptor(key: "userName", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))]
        do {
            return try PersistenceService.sharedInstance.context.fetch(usersRequest)
        } catch {
            print("error retrieving users")
            return []
        }
    }
    
}
