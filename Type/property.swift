// プロパティ

// インスタンスプロパティ
// インスタンスに紐付くプロパティ
struct Player {
    var name = "momon"
}

let player1 = Player()
var player2 = Player()
player2.name = "koji"
print("nameOfPlayer1: \(player1.name)")
print("nameOfPlayer2: \(player2.name)")

// スタティックプロパティ
// 型そのものに紐付くプロパティ
// インスタンス間で共通する値の保持などに使用する
struct Message {
    static let signature = "Sent from Original Game"
    
    var to: String
    var body:String
}

func print(message: Message) {
    print("to: \(message.to)")
    print("body: \(message.body)")
    print("signature: \(Message.signature)")
}

let message1 = Message(to: "player1", body: "Hello!")
let message2 = Message(to: "player2", body: "Hi!")
print(message: message1)
print(message: message2)

// ストアドプロパティ
// 値を保持するプロパティ
struct Stage {
    // プロパティオブザーバー
    // ストアドプロパティの値の変更を監視する
    var name: String {
        willSet {
            print("willSet: (to: \(self.name), newVlue: \(newValue))")
        }
        didSet {
            print("didSet: (to: \(self.name))")
        }
    }
}

var stage1 = Stage(name: "Mid Land")
stage1.name = "Ice Land"

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

