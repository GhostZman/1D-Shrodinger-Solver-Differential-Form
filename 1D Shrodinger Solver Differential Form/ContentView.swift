//
//  ContentView.swift
//  1D Shrodinger Solver Differential Form
//
//  Created by Phys440Zachary on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    let wellOptions = ["Square Well", "Linear Well", "Parabolic Well", "Square + Linear Well", "Square Barrier", "Triangle Barrier", "Coupled Parabolic Well", "Coupled Square Well + Field", "Harmonic Oscillator", "Kronig - Penney", "KP2-a"]
    
    @State private var selectedOptionIndex = 0
    
    @State private var isLoading = false
    @State private var mass = "1"
    @State private var minEnergy = "0.0"
    @State private var maxEnergy = "10.0"
    @State private var energyIncrement = "0.1"
    @State private var steps = "100"
    @State private var length = "10"
    
    let mySolver = RungeKuttaODE()
    
    var body: some View {
        
        VStack {
            Picker("Select Potential", selection: $selectedOptionIndex) {
                ForEach(0 ..< wellOptions.count) {
                    Text(self.wellOptions[$0])
                }
            }
            HStack{
                Text("Mass (e- mass)")
                TextField("Mass (e- mass)", text: $mass)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack{
                Text("Minimum energy")
                TextField("Minimum energy", text: $minEnergy)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack{
                Text("Maximum energy")
                TextField("Maximum energy", text: $maxEnergy)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack{
                Text("Energy increment")
                TextField("Energy increment", text: $energyIncrement)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack{
                Text("# Steps")
                TextField("# Steps", text: $steps)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack{
                Text("Length")
                TextField("Length", text: $length)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            Button(action: calculate){
                if isLoading {
                    ProgressView()
                } else {
                    Text("Calculate")
                }
            }
            .disabled(isLoading)
            .padding(.bottom)
            .padding()
            Text("\(mySolver.energyString)")
        }
    }
    func calculate() {
        isLoading = true
        let result: [Double] = mySolver.rk0(mass: Double(mass) ?? 1, potential: wellOptions[selectedOptionIndex], energyIncrement: Double(energyIncrement) ?? 0.1, minEnergy: Double(minEnergy) ?? 0, maxEnergy: Double(maxEnergy) ?? 10, iterations: Int(steps) ?? 100, length: Double(length) ?? 10)
        isLoading = false
        //print(result)
    }
}

