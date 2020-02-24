//
//  NoteItem.swift
//  MyNoteBookCoreData
//
//  Created by Frederic Filsoof on 24/02/2020.
//  Copyright © 2020 Frederic Filsoof. All rights reserved.
//

import Foundation
import CoreData


public class NoteItem:NSManagedObject, Identifiable {
    
    @NSManaged  public var text:String?
    
    
}

extension NoteItem {
    
    
    static func getAllNoteItems() -> NSFetchRequest<NoteItem> {
        
        let request:NSFetchRequest<NoteItem> = NoteItem.fetchRequest() as! NSFetchRequest<NoteItem>
        
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }
}
