//
//  ButtonStyles.swift
//  Edutainment
//
//  Created by Jesus Calleja on 25/10/22.
//

import SwiftUI

struct RoundButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(36)
            .font(.title.bold())
            .foregroundColor(.orange)
            .background(Circle()
                .fill(Color.black))
    }
    
}

struct QuestionButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .font(.title.bold()).foregroundColor(.black).frame(alignment: .center)
            .background(Rectangle()
            .fill(Color.orange))
    }
}

struct AnswerButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 100)
            .font(.title.bold())
            .foregroundColor(.orange)
            .background(Circle()
                .fill(Color.black))
    }
    
}
