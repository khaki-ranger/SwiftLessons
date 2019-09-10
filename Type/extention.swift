// エクステンション
// 型の拡張
// すでに存在している型に型を構成する要素（プロパティ、メソッド、イニシャライザなど）を追加する

enum Job: String {
    case fighter
    case wizard
    case bishop
}

struct Player {
    let id: Int
    var name: String
    var job: Job
}

let player1 = Player(id: 1, name: "momon", job: .fighter)

// メソッドの追加
extension Player {
    func attack(to: String) {
        print("\(to)に攻撃!")
    }
}

player1.attack(to: "ゴブリン")

// プロパティの追加
// コンピューテッドプロパティのみ追加することができる
// ストアドプロパティを追加することはできない
extension Player {
    var enclosedName: String {
        return "【\(name)】"
    }
}

print("Name: \(player1.enclosedName)")

// イニシャライザの追加
extension Player {
    // 外部引数名を省略したイニシャライザを定義
    init(_ id: Int, _ name: String, _ job: Job) {
        self.id = id
        self.name = name
        self.job = job
    }
}

let player2 = Player(2, "koji", .wizard)
print("player2 [id: \(player2.id), name: \(player2.name), job: \(player2.job)]")
