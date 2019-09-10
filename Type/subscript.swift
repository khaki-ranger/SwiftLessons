// サブスクリプト
// コレクションの要素へのアクセスを統一的に表すための文法

// 数列
struct Progression {
    var numbers: [Int]
    
    subscript(index: Int) -> Int {
        get {
            return numbers[index]
        }
        set {
            numbers[index] = newValue
        }
    }
}

var progression = Progression(numbers: [1, 2, 3])
print("element: \(progression[1])")
progression[1] = 4
print("element: \(progression[1])")

// 引数が複数ある場合の例
// 行列
struct Matrix {
    var rows: [[Int]]
    
    subscript(row: Int, column: Int) -> Int {
        get {
            return rows[row][column]
        }
        set {
            rows[row][column] = newValue
        }
    }
    
    // セッタを省略した場合は、getキーワードと{}を省略することが可能
//    subscript(row: Int, column: Int) -> Int {
//        return rows[row][column]
//    }
}

let matrix = Matrix(rows: [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

print("element: \(matrix[1, 1])")
