//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by vikas on 07/05/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   // @State private var showingAlert = false
    @State private var finalScore = 0
    @State private var userScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
            VStack(spacing:30) {
                VStack{
                     Text("Tap the Flag of")
                        .foregroundColor(.white)
                     Text(countries[correctAnswer])
                           .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
    
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black,lineWidth:1))
                        .shadow(color: .black,radius:2)
                    }
                }
                Spacer()
            }
        }.alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message:
                Text("your score are: \(userScore)")
                , dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
    }
    
    
    func flagTapped(_ number:Int) {
        if number == correctAnswer{
            scoreTitle = "Correct"
            userScore += 1
        }else{
            scoreTitle = "Wrong This flag is of \(countries[number])"
            if scoreTitle != "Correct"{
                userScore = 0
            }
        }
        
        showingScore = true
        
    }
    
     func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
