//
//  LabelMo+CoreDataProperties.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 13/04/21.
//
//

import Foundation
import CoreData


extension LabelMo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LabelMo> {
        return NSFetchRequest<LabelMo>(entityName: "LabelMo")
    }

    @NSManaged public var emojiLogo: String?
    @NSManaged public var isChecked: Bool
    @NSManaged public var isEditable: Bool
    @NSManaged public var reason: String?
    @NSManaged public var parentJournaling: JournalingMo?

}

extension LabelMo : Identifiable {

}
