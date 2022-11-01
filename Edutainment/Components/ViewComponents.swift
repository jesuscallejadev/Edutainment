//
//  ViewComponents.swift
//  Edutainment
//
//  Created by Jesus Calleja on 25/10/22.
//

import SwiftUI

struct SelectableButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(self.title, action: self.action)
            .font(.system(.title).bold())
            .foregroundColor(Color.black)
            .padding(6)
            .background(self.isSelected ? Rectangle().fill(Color.orange) : Rectangle().fill(Color.clear))
    }
}
