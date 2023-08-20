//
//  CoreDataViewModel.swift
//  Release
//
//  Created by mora hakim on 25/07/23.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    @Published var selectedMood: String = ""
    let container: NSPersistentContainer
    @Published var savedEntities: [Journal] = []
    init() {
        container = NSPersistentContainer(name: "Journals")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error Loading Core Data \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        fetchJournal()
    }
    func fetchJournal() {
        let request = NSFetchRequest<Journal>(entityName: "Journal")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    func addJournal(text: String, date: Date, title: String, mood: String, endMood: String) {
        let newJournal = Journal(context: container.viewContext)
        newJournal.content = text
        newJournal.date = date
        newJournal.title = title
        newJournal.mood = mood
        newJournal.endMood = endMood
        saveData()
    }
    func saveData() {
        do {
            try container.viewContext.save()
            fetchJournal()
        } catch let error {
            print("Error saving \(error)")
        }
    }
}
