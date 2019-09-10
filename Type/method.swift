// メソッド

// インスタンスメソッド
// 型のインスタンスに紐付くメソッド
struct Player {
    let id: Int
    var name: String
    
    func printPlayer() {
        print("id: \(self.id), name: \(self.name)")
    }
}

var player1 = Player(id: 1, name: "momon")
player1.printPlayer()
var player2 = Player(id: 2, name: "koji")
player2.printPlayer()


// スタティックメソッド
// 型自身に紐付くメソッド
struct Message {
    static var signature = "Sent from Original Game"
    
    static func setSignature(title: String) {
        signature = "Sent from \(title)"
    }
    
    var to: String
    var body: String {
        return "Hello, \(to)!\n\(Message.signature)"
    }
}

let message1 = Message(to: "momon")
print(message1.body)
print("--")
Message.setSignature(title: "Super Game")
let message2 = Message(to: "koji")
print(message2.body)

// オーバーロード
// 異なる型の引数や戻り値を取る同名のメソッドを複数用意し、
// 引数に渡される型や戻り値の代入先の型に応じて実行するメソッドを切り替える手法
struct Item {
    let id: Int
    let name: String
    
    // 引数の型によるオーバーロード
    func put(_ value: Int) {
        print("id: \(value)")
    }
    func put(_ value: String) {
        print("name: \(value)")
    }
    
    // 戻り値の型によるオーバーロード
    func getValue() -> Int {
        return id
    }
    func getValue() -> String {
        return name
    }
}

let item = Item(id: 1, name: "棍棒")
item.put(1)
item.put("棍棒")
// 戻り値の代入先の定数の型によって実行されるメソッドが切り替わる
let id:Int = item.getValue()
let name:String = item.getValue()
print("アイテム [id: \(id), name: \(name)]")
