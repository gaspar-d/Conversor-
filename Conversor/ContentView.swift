//
//  ContentView.swift
//  Conversor
//
//  Created by Diogo Gaspar on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue = ""
    @State var optionsFrom = 0
    @State var optionsTo = 0
    
    var convertFrom = ["Celsius", "Fahrenheit", "Kelvin"]
    var convertTo = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertInput: Double {
        let userInput = Double(inputValue) ?? 0
        
        if inputValue == "" {
            return 0
        }else {
//      Converting all inputs to Celsius
            switch optionsFrom {
            case 0:
                return userInput
            case 1:
                return (userInput - 32) * 5/9
            case 2:
                return userInput - 273.15
            default:
                return 0
            }
        }
    }
    
    var convertOutput: Double {
        let userOutput = convertInput
        
        if inputValue == "" {
            return 0
        } else {
//      Uses Celsius as base
            switch optionsTo {
            case 0:
                return userOutput
            case 1:
                return (userOutput * 9/5) + 32
            case 2:
                return userOutput + 273.15
            default:
                return 0
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Enter a value to convert...", text: $inputValue).keyboardType(.decimalPad)
                }
                
                Section(header: Text("Convert from ?").textCase(nil)) {
                    Picker("Select a kind of input", selection: $optionsFrom) {
                        ForEach(0 ..< convertFrom.count) {
                            Text("\(convertFrom[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert into").textCase(nil)) {
                    Picker("Type you want to convert to", selection: $optionsTo) {
                        ForEach(0 ..< convertTo.count) {
                            Text("\(convertTo[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result").textCase(nil)) {
                    Text("\(convertOutput, specifier: "%.1f")º")
                }
            }
            .navigationTitle("Conversions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
