//
//  JournalingMo+CoreDataProperties.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 13/04/21.
//
//

import Foundation
import CoreData


extension JournalingMo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalingMo> {
        return NSFetchRequest<JournalingMo>(entityName: "JournalingMo")
    }

    @NSManaged public var becauseOf: String?
    @NSManaged public var emot: String?
    @NSManaged public var feelings: String?
    @NSManaged public var wdyt: String?
    @NSManaged public var childLabel: NSSet?
    @NSManaged public var parentTimes: TimesMo?

}

// MARK: Generated accessors for childLabel
extension JournalingMo {

    @objc(addChildLabelObject:)
    @NSManaged public func addToChildLabel(_ value: LabelMo)

    @objc(removeChildLabelObject:)
    @NSManaged public func removeFromChildLabel(_ value: LabelMo)

    @objc(addChildLabel:)
    @NSManaged public func addToChildLabel(_ values: NSSet)

    @objc(removeChildLabel:)
    @NSManaged public func removeFromChildLabel(_ values: NSSet)

}

extension JournalingMo : Identifiable {

}
