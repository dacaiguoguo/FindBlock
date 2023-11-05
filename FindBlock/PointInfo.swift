//
//  PointInfo.swift
//  FindBlock
//
//  Created by yanguo sun on 2023/11/2.
//

import Foundation
class PointInfo : CustomDebugStringConvertible  {
    let x: Int
    let y: Int
    let z: Int
    let value: Int
    var up: PointInfo?
    var down: PointInfo?
    var left: PointInfo?
    var right: PointInfo?
    var front: PointInfo?
    var back: PointInfo?

    init(x: Int, y: Int, z: Int, value: Int) {
        self.x = x
        self.y = y
        self.z = z
        self.value = value
    }

    var debugDescription: String {
        "(x:\(x), y:\(y), z:\(z), value:\(value))"
    }
}

func mapTo3DPointInfo(array3d: [[[Int]]]) -> [[[PointInfo]]] {
    let rows = array3d.count
    let cols = array3d[0].count
    let depth = array3d[0][0].count

    var pointInfoArray: [[[PointInfo]]] = Array(repeating: Array(repeating: Array(repeating: PointInfo(x: 0, y: 0, z: 0, value: 0), count: depth), count: cols), count: rows)

    for i in 0..<rows {
        for j in 0..<cols {
            for k in 0..<depth {
                let value = array3d[i][j][k]
                pointInfoArray[i][j][k] = PointInfo(x: i, y: j, z: k, value: value)
            }
        }
    }

    // 设置每个点的上、下、左、右、前、后指向
    for i in 0..<rows {
        for j in 0..<cols {
            for k in 0..<depth {
                let currentPoint = pointInfoArray[i][j][k]

                if i > 0 {
                    currentPoint.up = pointInfoArray[i - 1][j][k]
                }

                if i < rows - 1 {
                    currentPoint.down = pointInfoArray[i + 1][j][k]
                }

                if j > 0 {
                    currentPoint.left = pointInfoArray[i][j - 1][k]
                }

                if j < cols - 1 {
                    currentPoint.right = pointInfoArray[i][j + 1][k]
                }

                if k > 0 {
                    currentPoint.front = pointInfoArray[i][j][k - 1]
                }

                if k < depth - 1 {
                    currentPoint.back = pointInfoArray[i][j][k + 1]
                }
            }
        }
    }

    return pointInfoArray
}

func hasContinuousEqualValues(pointInfo3DArray: [[[PointInfo]]]) -> Bool {
    let rows = pointInfo3DArray.count
    let cols = pointInfo3DArray[0].count
    let depth = pointInfo3DArray[0][0].count
//    struct Person {
//        let name: String
//        let age: Int
//    }
//
//    let person = Person(name: "John", age: 30)
//
//    let propertyName = "name"
//
//    if let value = Mirror(reflecting: person).children.first(where: { $0.label == propertyName })?.value {
//        print("Property \(propertyName): \(value)")
//    } else {
//        print("Property not found")
//    }
// 无非就是 水平的还是 垂直的，如果是水平的，先看启发方向是那边，如果是
    // L就有24个方向，然后再给一个初始方向，就可以知道需要怎样的旋转才能和目标对齐。
    for i in 0..<rows {
        for j in 0..<cols {
            for k in 0..<depth {
                let currentPoint = pointInfo3DArray[i][j][k]
                let value = currentPoint.value

                // 检查上方连续三个值是否相等
                if let up1 = currentPoint.up,
                   let up2 = up1.up,
                   up1.value == value && up2.value == value {
                    if let right2up = up2.left, right2up.value == value {
                        print("has same \(#line)\(up1) \(up2) \(right2up)")
                        return true
                    }
                    if let right2up = up2.right, right2up.value == value {
                        print("has same \(#line)\(up1) \(up2) \(right2up)")
                        return true
                    }
                    if let right2up = up2.front, right2up.value == value {
                        print("has same \(#line)水平向后，向左\(up1) \(up2) \(right2up)")
                        return true
                    }
                    if let right2up = up2.back, right2up.value == value {
                        print("has same \(#line)水平向后，向右\(up1) \(up2) \(right2up)")
                        return true
                    }
                }

                // 检查下方连续三个值是否相等
                if let down1 = currentPoint.down,
                   let down2 = down1.down,
                   down1.value == value && down2.value == value {
                    if let right2up = down2.left, right2up.value == value {
                        print("has same \(#line)\(down1) \(down2) \(right2up)")
                        return true
                    }
                    if let right2up = down2.right, right2up.value == value {
                        print("has same \(#line)\(down1) \(down2) \(right2up)")

                        return true
                    }
                    if let right2up = down2.front, right2up.value == value {
                        print("has same \(#line)\(down1) \(down2) \(right2up)")
                        return true
                    }
                    if let right2up = down2.back, right2up.value == value {
                        print("has same \(#line)\(down1) \(down2) \(right2up)")
                        return true
                    }
                }

                // 检查左方连续三个值是否相等
                if let left1 = currentPoint.left,
                   let left2 = left1.left,
                   left1.value == value && left2.value == value {
                    if let right2up = left2.up, right2up.value == value {
                        print("has same \(#line)\(left1) \(left2) \(right2up)")
                        return true
                    }
                    if let right2up = left2.down, right2up.value == value {
                        print("has same \(#line)\(left1) \(left2) \(right2up)")
                        return true
                    }
                    if let right2up = left2.front, right2up.value == value {
                        print("has same \(#line)\(left1) \(left2) \(right2up)")
                        return true
                    }
                    if let right2up = left2.back, right2up.value == value {
                        print("has same \(#line)\(left1) \(left2) \(right2up)")
                        return true
                    }
                }

                // 检查右方连续三个值是否相等
                if let right1 = currentPoint.right,
                   let right2 = right1.right,
                   right1.value == value && right2.value == value {
                    if let right2up = right2.up, right2up.value == value {
                        print("has same \(#line)\(right1) \(right2) \(right2up)")
                        return true
                    }
                    if let right2up = right2.down, right2up.value == value {
                        print("has same \(#line)\(right1) \(right2) \(right2up)")
                        return true
                    }
                    if let right2up = right2.front, right2up.value == value {
                        print("has same \(#line)\(right1) \(right2) \(right2up)")
                        return true
                    }
                    if let right2up = right2.back, right2up.value == value {
                        print("has same \(#line)\(right1) \(right2) \(right2up)")
                        return true
                    }
                }

                // 检查前方连续三个值是否相等
                if let front1 = currentPoint.front,
                   let front2 = front1.front,
                   front1.value == value && front2.value == value {
                    if let right2up = front2.up, right2up.value == value {
                        print("has same \(#line) 水平向左，向后\(currentPoint) \(front1) \(front2) \(right2up)")
                        return true
                    }
                    if let right2up = front2.down, right2up.value == value {
                        print("has same \(#line) 水平向左，向前\(currentPoint) \(front1) \(front2) \(right2up)")
                        return true
                    }
                    if let right2up = front2.left, right2up.value == value {
                        print("has same \(#line)\(front1) \(front2) \(right2up)")
                        return true
                    }
                    if let right2up = front2.right, right2up.value == value {
                        print("has same \(#line)\(front1) \(front2) \(right2up)")
                        return true
                    }
                }

                // 检查后方连续三个值是否相等
                if let back1 = currentPoint.back,
                   let back2 = back1.back,
                   back1.value == value && back2.value == value {
                    if let right2up = back2.up, right2up.value == value {
                        print("has same \(#line) 水平向右，向后\(back1) \(back2) \(right2up)")
                        return true
                    }
                    if let right2up = back2.down, right2up.value == value {
                        print("has same \(#line) 水平向右，向前\(back1) \(back2) \(right2up)")
                        return true
                    }
                    if let right2up = back2.left, right2up.value == value {
                        print("has same \(#line)\(back1) \(back2) \(right2up)")
                        return true
                    }
                    if let right2up = back2.right, right2up.value == value {
                        print("has same \(#line)\(back1) \(back2) \(right2up)")
                        return true
                    }
                }
            }
        }
    }

    return false
}

