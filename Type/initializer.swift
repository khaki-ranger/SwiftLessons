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
