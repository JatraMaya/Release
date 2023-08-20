//
//  Journal+CoreDataProperties.swift
//  Release!
//
//  Created by mora hakim on 27/07/23.
//
//

import Foundation
import CoreData

extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var mood: String?
    @NSManaged public var title: String?
    @NSManaged public var endMood: String?

}

extension Journal: Identifiable {
}
