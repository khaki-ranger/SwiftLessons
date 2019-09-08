/*
 型
 型（構造体、クラス、列挙型）に共通する構成要素
*/

// プロパティ

// インスタンスプロパティ
// インスタンスに紐付くプロパティ
struct Player {
    var name = "Takuya Kai"
}

let player1 = Player()
var player2 = Player()
player2.name = "Kodai Senga"
print("nameOfPlayer1: \(player1.name)")
print("nameOfPlayer2: \(player2.name)")

// スタティックプロパティ
// 型そのものに紐付くプロパティ
// インスタンス間で共通する値の保持などに使用する
struct Fruit {
    static let signature = "Made in Japan"
    var name: String
}

func print(fruit: Fruit) {
    print("name: \(fruit.name)")
    print("signature: \(Fruit.signature)")
}

let apple = Fruit(name: "apple")
let orange = Fruit(name: "orange")
print(fruit: apple)
print(fruit: orange)

// ストアドプロパティ
// 値を保持するプロパティ
// プロパティオブザーバー
// ストアドプロパティの値の変更を監視する
struct Greeting {
    var to = "Takuya Kai" {
        willSet {
            print("willSet: (to: \(self.to), newValue: \(newValue))")
        }
        didSet {
            print("didSet: (to: \(self.to))")
        }
    }
}

var greeting = Greeting()
greeting.to = "Kodai Senga"

// コンピューテッドプロパティ
// 値を保持せずストアドプロパティから値を算出するプロパティ
struct Temperature {
    // 摂氏温度
    var celsius: Double = 0.0
    
    // 華氏温度
    var fahrenheit: Double {
        get {
            return (9.0 / 5.0) * celsius + 32.0
        }
        set {
            celsius = (5.0 / 9.0) * (newValue - 32.0)
        }
    }
}

var temperature = Temperature()
print("celsius: \(temperature.celsius), fahrenheit: \(temperature.fahrenheit)")
temperature.celsius = 20
print("celsius: \(temperature.celsius), fahrenheit: \(temperature.fahrenheit)")
temperature.fahrenheit = 32
print("celsius: \(temperature.celsius), fahrenheit: \(temperature.fahrenheit)")

// イニシャライザ

struct Stage {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let stage1 = Stage(name: "First Stage")
print("Name of Stage: \(stage1.name)")

// 失敗可能イニシャライザ
// 初期化の失敗を考慮したイニシャライザ
// WebAPI経由など、受信するデータを保証できないケースで使用する

struct Item {
    let id: Int
    let title: String
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? Int,
              let title = dictionary["title"] as? String else {
                // このケースではidとtitleは未初期化のままでもコンパイル可能
                return nil
        }
        self.id = id
        self.title = title
    }
}

// 受信するデータ
let dictionaries: [[String: Any]] = [
    ["id": 1, "title": "apple"],
    ["id": 2, "title": "orange"],
    ["title": "peach"], // idが欠けている辞書
    ["id": 4, "title": "grape"]
]

for dictionary in dictionaries {
    // 失敗可能イニシャライザはItem?を返す
    if let item = Item(dictionary: dictionary) {
        print(item)
    } else {
        print("エラー: 辞書\(dictionary)からItemを生成できませんでした")
    }
}
