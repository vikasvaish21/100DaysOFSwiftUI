//
//  ContentView.swift
//  WeSplit
//
//  Created by vikas on 24/04/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    let tipPecentages = [10,15,20,25,0]
    
    var totalPerPerson:Double{
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPecentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var TotalAmount:Double{
        let tipSelection = Double(tipPecentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let originalAmount = orderAmount + tipValue
        return originalAmount
    }
    var body: some View{
    NavigationView{
        Form{
            Section{
                TextField("Amount",text: $checkAmount)
                    .keyboardType(.decimalPad)
                TextField("Number of People",text: $numberOfPeople)                }
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip Percentage",selection: $tipPercentage){
                    ForEach(0..<tipPecentages.count){
                        Text("\(self.tipPecentages[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson)")
            }
            Section(header: Text("Total Amount For The check")){
                Text("$\(TotalAmount)")
                
            }
            
           }
        .navigationBarTitle(Text("WeSplit"),displayMode: .inline)
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
