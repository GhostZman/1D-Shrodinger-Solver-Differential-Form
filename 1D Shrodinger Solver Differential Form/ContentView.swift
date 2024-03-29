//
//  ContentView.swift
//  1D Shrodinger Solver Differential Form
//
//  Created by Phys440Zachary on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Calculate", action: {self.calculate()})
                .padding(.bottom)
                .padding()
        }
        .padding()
    }
    func calculate() {
        let mySolver = RungeKuttaODE()
        let result: [Double] = mySolver.rk0(mass: 1, potential: 0, energyIncrement: 0.1, maxEnergy: 20, iterations: 1000000, length: 10)
        //print(result)
    }
}

#Preview {
    ContentView()
}
