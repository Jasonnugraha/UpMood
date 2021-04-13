//
//  DatesMo+CoreDataProperties.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 13/04/21.
//
//

import Foundation
import CoreData


extension DatesMo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DatesMo> {
        return NSFetchRequest<DatesMo>(entityName: "DatesMo")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var childTimes: NSSet?

}

// MARK: Generated accessors for childTimes
extension DatesMo {

    @objc(addChildTimesObject:)
    @NSManaged public func addToChildTimes(_ value: TimesMo)

    @objc(removeChildTimesObject:)
    @NSManaged public func removeFromChildTimes(_ value: TimesMo)

    @objc(addChildTimes:)
    @NSManaged public func addToChildTimes(_ values: NSSet)

    @objc(removeChildTimes:)
    @NSManaged public func removeFromChildTimes(_ values: NSSet)

}

extension DatesMo : Identifiable {

}
