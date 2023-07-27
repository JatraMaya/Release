//
//  SpeakViewModel.swift
//  Release
//
//  Created by mora hakim on 25/07/23.
//

import Foundation
import EventKit

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var eventDates: [Date] = []
    let eventStore = EKEventStore()
    
    
    
    func addNote(content: String) {
        let note = Note(content: content, createdAt: Date())
        notes.append(note)
        
        
        eventStore.requestAccess(to: .event) { [weak self] (granted, error) in
            if granted {
                // Izin diberikan, Anda dapat mengakses data kalender
                guard let self = self else { return }
                
                let event = EKEvent(eventStore: self.eventStore)
                event.title = "Catatan"
                event.startDate = note.createdAt
                event.endDate = note.createdAt
                event.calendar = self.eventStore.defaultCalendarForNewEvents
                
                do {
                    try self.eventStore.save(event, span: .thisEvent)
                    // Event berhasil dibuat di kalender
                } catch {
                    // Terjadi kesalahan saat membuat event di kalender
                    print("Error saving event: \(error.localizedDescription)")
                }
            } else {
                // Izin ditolak
            }
        }
        
        
        
    }
}
