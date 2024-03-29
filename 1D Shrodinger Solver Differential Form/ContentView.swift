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
    
    @State private var mass = ""
    @State private var minEnergy = ""
    @State private var maxEnergy = ""
    @State private var energyIncrement = ""
    @State private var steps = ""
    @State private var length = ""
    
    var body: some View {
        
        VStack {
            Picker("Select Potential", selection: $selectedOptionIndex) {
                ForEach(0 ..< wellOptions.count) {
                    Text(self.wellOptions[$0])
                }
            }
            TextField("Mass (e- mass)", text: $mass)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Minimum energy", text: $minEnergy)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Maximum energy", text: $maxEnergy)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Energy increment", text: $energyIncrement)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("# Steps", text: $steps)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Length", text: $length)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Calculate", action: {self.calculate()})
                .padding(.bottom)
                .padding()
        }
    }
    func calculate() {
        let mySolver = RungeKuttaODE()
        let result: [Double] = mySolver.rk0(mass: Double(mass) ?? 1, potential: 0, energyIncrement: 0.1, maxEnergy: 20, iterations: 1000000, length: 10)
        //print(result)
    }
}

