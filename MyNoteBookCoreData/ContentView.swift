//
//  ContentView.swift
//  MyNoteBookCoreData
//
//  Created by Frederic Filsoof on 24/02/2020.
//  Copyright © 2020 Frederic Filsoof. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var mangedObjectContext
    @FetchRequest(fetchRequest: NoteItem.getAllNoteItems()) var noteItems:FetchedResults<NoteItem>
    @State private var NewNoteItem = ""
    
    public var shownote:String = "te"


    
    var body: some View {
        NavigationView {
            
            List{
                Section(header: Text("Notes")) {
                    HStack {
                        TextField("New Note", text: self.$NewNoteItem)
                        Button(action: {
                            
                            let noteItem = NoteItem(context: self.mangedObjectContext)
                            
                            noteItem.text = self.NewNoteItem
                            
                         
                           
                            do {
                                
                                try self.mangedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            self.NewNoteItem = ""
                            
                            
                            
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                            
                        }
                    
                    }.font(.headline)
                    Section(header: Text("my notes")) {
                        ForEach(self.noteItems) { notes in
            
                            NoteItemView(title: notes.text!)
                            
                        }
                    }

            }
                    
         .navigationBarTitle(Text("My Notes"))
            .navigationBarItems(trailing: EditButton())
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
