//
//  Runge-Kutta ODE.swift
//  1D Shrodinger Solver Differential Form
//
//  Created by Phys440Zachary on 3/8/24.
//

import Foundation
import Observation

@Observable class RungeKuttaODE {
    
    let myPotential = Potentials()
    
    var k1: Double = 0.0
    var k2: Double = 0.0
    var k3: Double = 0.0
    var k4: Double = 0.0
    let hBar: Double = 6.58211959E-16 //eV*s
    let hBarSquaredOverMe = 7.6199642310738530886 //eV / A^2
    
    var energyVals: [Double] = []
    
    var energyString: String = ""
    
    func findK(order: Int, function: () -> Double){
        if order > 1 {
            findK(order: order - 1, function: function)
        }
        
    }
    func rk0(mass: Double, potential: String, energyIncrement: Double, minEnergy: Double, maxEnergy: Double, iterations: Int, length: Double) -> [Double] {
        var psi: Double
        var psiPrime: Double
        let xIncrement: Double = length / Double(iterations)
        var psiAtL: [Double] = []
        var energies: [Double] = []
        
        self.energyVals = []
        
        myPotential.getPotential(potentialType: potential, xMin: 0, xMax: length, xStep: xIncrement)
        
        for energy in stride(from: minEnergy, through: maxEnergy, by: energyIncrement){
            psiPrime = 1.0
            psi = 0.0
            energies.append(energy)
            
            var index = 0
            
            for xPos in stride(from: 0.0, to: length, by: xIncrement) {
                
                let nextPsi = psi + (psiPrime*xIncrement)
                let nextPsiPrime = psiPrime + (xIncrement * (((-2.0*psi)/hBarSquaredOverMe)*(energy - myPotential.oneDPotentialYArray[index])))
                //print(xPos,psi,psiPrime)
                psi = nextPsi
                psiPrime = nextPsiPrime
                //print(xPos,psi,psiPrime)
                index += 1
            }
            psiAtL.append(psi)
        }
        self.energyVals = findRoots(psi: psiAtL, energy: energies)
        self.energyString = ""
        for n in self.energyVals{
            self.energyString.append(String(n))
            self.energyString.append("\n")
        }
        
        return self.energyVals
    }
    func findRoots(psi: [Double], energy: [Double]) -> [Double]{
        
        var roots: [Double] = []
        for index in stride(from: 1, to: psi.count, by: 1) {
            if psi[index-1].sign != psi[index].sign{
                let m = (psi[index] - psi[index-1]) / (energy[index] - energy[index-1])
                let b = psi[index] - (m*energy[index])
                
                let root = -1*b/m
                roots.append(root)
                print(root)
            }
        }
        
        return roots
    }
    
    func rk2() {
        
    }
    
    func rk4() {
        
    }
}
