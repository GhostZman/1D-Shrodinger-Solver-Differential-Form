//
//  _D_Shrodinger_Solver_Differential_FormTests.swift
//  1D Shrodinger Solver Differential FormTests
//
//  Created by Phys440Zachary on 3/8/24.
//

import XCTest

final class _D_Shrodinger_Solver_Differential_FormTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRk0() throws {
        let mySolver = RungeKuttaODE()
        let result: (Double, Double) = mySolver.rk0(mass: 1, potential: 0, energyIncrement: 0.1, iterations: 5, length: 1, tolerance: 0.1)
        print(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
