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
    let hBar: Double = 1.0
    
    func findK(order: Int, function: () -> Double){
        if order > 1 {
            findK(order: order - 1, function: function)
        }
        
    }
    func rk0(mass: Double, psi: Double, psiPrime: Double, potential: Double, energy: Double, xIncrement: Double) {
        var nextPsiPrime: Double = psiPrime + xIncrement * (((-2.0*mass)/pow(hBar,2))*(energy - potential)*psi)
    }
    
    func rk2() {
        
    }
    
    func rk4() {
        
    }
}
