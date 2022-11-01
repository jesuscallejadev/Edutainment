//
//  QuestionsView.swift
//  Edutainment
//
//  Created by Jesus Calleja on 25/10/22.
//

import SwiftUI

struct QuestionsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let questions: [Question]
    @State private var selectedButton = 5
    @State private var initState: Bool = true
    @State private var userScore = 0
    @State private var questionCount = 0
    @State private var rotationDegrees = 0.0
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    
    private func checkScore(answer: String) {
        if (self.questions[self.questionCount].correctAnswer == answer) {
            self.userScore += 1
            self.alertTitle = "Correct! ✅"
            self.alertMessage = "Well done, that is the correct answer"
        } else {
            self.alertTitle = "Incorrect! ❌"
            self.alertMessage = "Wrong answer, keep trying"
        }
        self.showingAlert = true
    }
    
    private func nextRound() {
        self.showingAlert = false
        self.questionCount += 1
        self.initState = true
    }
    
    private func resetGame() {
        self.questionCount = 0
        self.userScore = 0
    }
    
    
    var body: some View {
        VStack {
            if(self.questionCount < self.questions.count) {
                Image(self.questions[self.questionCount].imageName)
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                Text("Question \(self.questionCount + 1) of \(self.questions.count)")
                    .foregroundColor(.black)
                    .font(.system(.title).bold())
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button("\(self.questions[self.questionCount].question)") {}.buttonStyle(QuestionButton()).frame(maxHeight: .infinity, alignment: .center)
                
                Text("Score: \(self.userScore)")
                    .foregroundColor(.black)
                    .font(.system(.title).bold())
                HStack {
                    ForEach(0..<3) { number in
                        Button("\(self.questions[self.questionCount].answers[number])") {
                            withAnimation {
                                self.initState = false
                                self.selectedButton = number
                                self.rotationDegrees += 360
                                self.checkScore(answer: self.questions[self.questionCount].answers[number])
                            }
                        }.buttonStyle(AnswerButton())
                            .opacity(!self.initState && (number != self.selectedButton) ? 0.1 : 1.0)
                            .scaleEffect(!self.initState && (number != self.selectedButton) ? 0.5 : 1.0)
                            .rotation3DEffect(.degrees(number == self.selectedButton ? self.rotationDegrees : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }.frame(maxHeight: .infinity, alignment: .bottom)
            } else {
                VStack {
                    Spacer()
                    Spacer()
                    HStack {
                        Image("buffalo")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("chicken")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("crocodile")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("rabbit")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("penguin")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("horse")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("zebra")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }
                    Button("Your final score is: \(self.userScore)/\(self.questions.count)") {
                        
                    }
                    .buttonStyle(QuestionButton())
                    .frame(maxHeight: .infinity, alignment: .center)
                    HStack {
                        Image("cow")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("bear")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("elephant")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("gorilla")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("pig")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("parrot")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Image("hippo")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }
                    HStack {
                        Button("Try again") {
                            self.resetGame()
                        }.buttonStyle(RoundButton())
                        Button("Go to Settings") {
                            self.presentationMode.wrappedValue.dismiss()
                        }.buttonStyle(RoundButton())
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                    
                }
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(.yellow)
        .alert(self.alertTitle, isPresented: $showingAlert, actions: {
            Button("Continue") {
                self.nextRound()
            }
        }, message: {
            Text(self.alertMessage)
        })
        .navigationBarBackButtonHidden(true)
    }
}
