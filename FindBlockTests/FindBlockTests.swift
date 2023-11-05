//
//  FindBlockTests.swift
//  FindBlockTests
//
//  Created by yanguo sun on 202/11/2.
//

import XCTest
@testable import FindBlock

final class FindBlockTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample5() throws {
        // 三维数组
        let array3dList = [
            [
                [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]],
                [[-1, -1, 2], [2, 2, 2], [-1, -1, -1]],
                [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]],
            ],[
                [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]],
                [[-1, -1, -1], [2, 2, 2], [-1, -1, 2]],
                [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]],
            ],
            [
                [[-1, -1, -1], [-1, -1, 2], [-1, -1, -1]],
                [[-1, -1, -1], [2, 2, 2], [-1, -1, -1]],
                [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]],
            ],[
                [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]],
                [[-1, -1, -1], [2, 2, 2], [-1, -1, -1]],
                [[-1, -1, -1], [-1, -1, 2], [-1, -1, -1]],
            ]
        ]

        array3dList.forEach { array3d in
            // 映射成三维 PointInfo 类的实例
            let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
            let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
            XCTAssert(ret)
        }
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
