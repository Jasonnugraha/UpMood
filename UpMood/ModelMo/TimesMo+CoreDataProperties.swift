//
//  TimesMo+CoreDataProperties.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 13/04/21.
//
//

import Foundation
import CoreData


extension TimesMo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimesMo> {
        return NSFetchRequest<TimesMo>(entityName: "TimesMo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var times: Date?
    @NSManaged public var childJournaling: JournalingMo?
    @NSManaged public var parentDates: DatesMo?

}

extension TimesMo : Identifiable {

}
