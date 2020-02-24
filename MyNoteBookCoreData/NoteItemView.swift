//
//  NoteItemView.swift
//  MyNoteBookCoreData
//
//  Created by Frederic Filsoof on 24/02/2020.
//  Copyright © 2020 Frederic Filsoof. All rights reserved.
//

import SwiftUI

struct NoteItemView: View {
    var title:String = ""


var body: some View {
    
    HStack {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.headline)
            }
        
        
        }
    }

}


struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(title: "testing")
    }
}
