//
//  Runge-Kutta ODE.swift
//  1D Shrodinger Solver Differential Form
//
//  Created by Phys440Zachary on 3/8/24.
//

import Foundation
import Observation

@Observable class RungeKuttaODE {
    
    var k1: Double = 0.0
    var k2: Double = 0.0
    var k3: Double = 0.0
    var k4: Double = 0.0
    let hBar: Double = 1.054571817E-34
    
    func findK(order: Int, function: () -> Double){
        if order > 1 {
            findK(order: order - 1, function: function)
        }
        
    }
    func rk0(mass: Double, potential: Double, energyIncrement: Double, iterations: Int, length: Double, tolerance: Double) -> (psiPrime: Double, energy: Double) {
        var psi: Double = 0.0
        var psiPrime: Double = 1.0
        var energy: Double = 0.0
        let xIncrement: Double = length / Double(iterations)
        repeat{
            energy = energy + energyIncrement
            for xPos in stride(from: 0.0, to: length, by: xIncrement) {
                let nextPsi = psi + psiPrime*xIncrement
                psiPrime = psiPrime + xIncrement * (((-2.0*mass)/pow(hBar,2))*(energy - potential)*psi)
                psi = nextPsi
            }
        } while (psi > tolerance || psi < -1*tolerance)
        return (psiPrime, energy)
    }
    
    func rk2() {
        
    }
    
    func rk4() {
        
    }
}
