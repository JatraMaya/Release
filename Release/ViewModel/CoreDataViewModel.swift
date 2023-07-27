//
//  CoreDataViewModel.swift
//  Release
//
//  Created by mora hakim on 25/07/23.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [Journal] = []
    
    init() {
        container = NSPersistentContainer(name: "Journals")
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Error Loading Core Data \(error)")
            }
        }
        
        fetchJournal()
    }
    
    func fetchJournal() {
        let request = NSFetchRequest<Journal>(entityName: "Journal")
        
        do {
            try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func addJournal(text: String, date: Date, title: String) {
        let newJournal = Journal(context: container.viewContext)
        newJournal.content = text
        newJournal.date = date
        newJournal.title = title
        saveData()
    }
    
    func saveData() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch let error {
                print("Error saving \(error)")
            }
        }
     
    }
    
}
