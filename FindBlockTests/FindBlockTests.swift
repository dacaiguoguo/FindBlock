//
//  FindBlockTests.swift
//  FindBlockTests
//
//  Created by yanguo sun on 2023/11/2.
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

    func testExample() throws {
        // 三维数组
        let array3d = [
            [[1, 2, 3],    [4, 5, 6],    [7, 8, 9]],
            [[21, 22, 23], [24, 25, 26], [27, 28, 33]],
            [[31, 32, 33], [34, 35, 33], [37, 38, 33]],
        ]

        // 映射成三维 PointInfo 类的实例
        let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
        // 示例用法
        let hasContinuousEqual = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print("是否存在连续三个相等的值: \(hasContinuousEqual)")

        let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        XCTAssertTrue(ret)
    }

    func testExample2() throws {
        // 三维数组
        let array3d = [
            [[1, 2, 3],    [4, 5, 6],    [7, 8, 9]],
            [[21, 22, 23], [24, 25, 26], [27, 28, 33]],
            [[31, 32, 33], [34, 35, 31], [37, 38, 33]],
        ]

        // 映射成三维 PointInfo 类的实例
        let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
        // 示例用法
        let hasContinuousEqual = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print("是否存在连续三个相等的值: \(hasContinuousEqual)")

        let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print(ret)
        XCTAssertFalse(ret)
    }

    func testExample3() throws {
        // 三维数组
        let array3d = [
            [[1, 2, 3],    [4, 5, 6],    [7, 22, 9]],
            [[21, 22, 23], [24, 22, 26], [27, 22, 33]],
            [[31, 32, 33], [34, 35, 36], [37, 38, 39]],
        ]

        // 映射成三维 PointInfo 类的实例
        let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
        // 示例用法
        let hasContinuousEqual = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print("是否存在连续三个相等的值: \(hasContinuousEqual)")

        let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print(ret)
        XCTAssert(ret)
    }


    func testExample4() throws {
        // 三维数组
        let array3d = [
            [[1, 22, 3],    [4, 5, 6],    [7, 8, 9]],
            [[21, 22, 23], [24, 22, 26], [27, 22, 33]],
            [[31, 32, 33], [34, 35, 36], [37, 38, 39]],
        ]

        // 映射成三维 PointInfo 类的实例
        let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
        // 示例用法
        let hasContinuousEqual = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print("是否存在连续三个相等的值: \(hasContinuousEqual)")

        let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print(ret)
        XCTAssert(ret)
    }

    func testExample5() throws {
        // 三维数组
        let array3d = [
            [[21, 2, 3],    [4, 5, 6],    [7, 8, 9]],
            [[21, 21, 21], [24, 25, 26], [27, 28, 33]],
            [[31, 32, 33], [34, 35, 36], [37, 38, 39]],
        ]

        // 映射成三维 PointInfo 类的实例
        let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
        // 示例用法
        let hasContinuousEqual = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print("是否存在连续三个相等的值: \(hasContinuousEqual)")

        let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print(ret)
        XCTAssert(ret)
    }

    func testExample6() throws {
        // 三维数组
        let array3d = [
            [[1, 2, 3],    [4, 5, 6],    [7, 8, 9]],
            [[21, 21, 21], [24, 25, 26], [27, 28, 33]],
            [[21, 32, 33], [34, 35, 36], [37, 38, 39]],
        ]

        // 映射成三维 PointInfo 类的实例
        let pointInfo3DArray = mapTo3DPointInfo(array3d: array3d)
        // 示例用法
        let hasContinuousEqual = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print("是否存在连续三个相等的值: \(hasContinuousEqual)")

        let ret = hasContinuousEqualValues(pointInfo3DArray: pointInfo3DArray)
        print(ret)
        XCTAssert(ret)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
