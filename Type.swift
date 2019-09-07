/*
 型
*/

// プロパティオブザーバー
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
