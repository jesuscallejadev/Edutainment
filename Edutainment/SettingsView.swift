//
//  SettingsView.swift
//  Edutainment
//
//  Created by Jesus Calleja on 24/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    private let numberOfQuestions = [5, 10, 20]
    @State private var selectedNumberOfQuestions = 10
    @State private var tableSelections: [Int] = [1,2,3,4,5,6,7,8,9,10]
    @State private var showFirstAnimation: Bool = false
    @State private var showSecondAnimation: Bool = false
    @State private var gameStarted: Bool = false
    @State private var questions: [Question] = []
    
    init() {
        UIToolbar.appearance().barTintColor = UIColor.systemOrange
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemOrange
    }
    
    private func onPickerChange(_: Int) {
        withAnimation {
            self.showSecondAnimation.toggle()
        }
    }
    
    private func startGame() {
        self.questions = self.generateQuestions(number: self.selectedNumberOfQuestions, selectedTables: self.tableSelections)
        withAnimation {
            self.showFirstAnimation.toggle()
            self.showSecondAnimation.toggle()
            self.gameStarted = true
        }
    }
    
    private func generateQuestions(number: Int, selectedTables: [Int]) -> [Question] {
        var randomQuestions = [Question]()
        let count = 1...number
        for _ in count {
            let firstNumber = (selectedTables.randomElement() ?? 0) as Int
            let secondNumber = Int.random(in: 0..<11)
            let result = firstNumber * secondNumber
            let fakeFirstNumber = (selectedTables.randomElement() ?? 0) as Int * Int.random(in: 0..<11)
            let fakeSecondNumber = (selectedTables.randomElement() ?? 0) as Int * Int.random(in: 0..<11)
            let answers = ["\(result)", "\(fakeFirstNumber)", "\(fakeSecondNumber)"]
            randomQuestions.append(Question(question: ("\(firstNumber)x\(secondNumber)"), correctAnswer: "\(result)" ,answers: answers.shuffled(), imageName: Animals().animalNames.randomElement() ?? ""))
        }
        
        return randomQuestions
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    Text("⚙️ Settings ⚙️")
                        .bold()
                        .font(.system(.largeTitle))
                        .foregroundColor(.black)
                    HStack {
                        Image("buffalo")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("chicken")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("crocodile")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("cow")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("bear")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("elephant")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        
                        Image("hippo")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showFirstAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                    }
                    
                    
                }
                
                Spacer()
                
                Section {
                    Text("Choose the multiplication table you want to practice")
                        .font(.system(.body))
                        .bold()
                        .foregroundColor(.black)
                    Spacer()
                    VStack{
                        HStack {
                            ForEach(1..<6) { number in
                                
                                SelectableButton(title: "\(number)", isSelected: self.tableSelections.contains(number))
                                {
                                    withAnimation {
                                        self.showFirstAnimation.toggle()
                                    }
                                    if self.tableSelections.contains(number) {
                                        self.tableSelections.removeAll(where: { $0 == number })
                                    }
                                    else {
                                        self.tableSelections.append(number)
                                    }
                                }
                                
                            }
                        }
                        HStack {
                            ForEach(6..<11) { number in
                                
                                SelectableButton(title: "\(number)", isSelected: self.tableSelections.contains(number))
                                {
                                    withAnimation {
                                        self.showFirstAnimation.toggle()
                                    }
                                    
                                    if self.tableSelections.contains(number) {
                                        self.tableSelections.removeAll(where: { $0 == number })
                                    }
                                    else {
                                        self.tableSelections.append(number)
                                    }
                                }
                                
                            }
                        }
                    }
                }
                
                Spacer()
                Section {
                    HStack {
                        Image("rabbit")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("penguin")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("horse")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("gorilla")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("pig")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("parrot")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        Image("zebra")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .rotation3DEffect(.degrees(self.showSecondAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                
                Spacer()
                
                Section {
                    Text("How many questions?")
                        .font(.system(.body))
                        .foregroundColor(.black)
                        .bold()
                    Spacer()
                    Picker("", selection: $selectedNumberOfQuestions.onChange(onPickerChange)) {
                        ForEach(self.numberOfQuestions, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    
                    .pickerStyle(.segmented)
                    Spacer()
                    Spacer()
                }
                NavigationLink(destination: QuestionsView(questions: self.questions), isActive: self.$gameStarted){}
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(.yellow)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Start") {
                    self.startGame()
                }
                .opacity(self.gameStarted ? 0 : 1)
                .scaleEffect(self.gameStarted ? 2.0 : 1.0)
                .buttonStyle(RoundButton())
            }
            
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
