/*
 デリゲートパターン
 
 オブジェクト間のイベント通知のパターンの一つで、
 CocoaやCocoaTouchの主要なコンポーネントの多くで実装されている。
 以下では、例としてデリゲートパターンを利用したゲームを表現。
*/

// デリゲート元のオブジェクトが、デリゲート先のオブジェクトに委譲する処理をプロトコルとして宣言
// プレイヤーの人数とゲームの開始、ゲームの終了時の処理を委譲するためのインターフェース
protocol GameDelegate: class {
    var numberOfPlayers: Int { get }
    func gameDidStart( _ game: Game )
    func gameDidEnd( _ game: Game )
}

// デリゲート先のオブジェクトのクラス
// プロトコルに準拠して、デリゲート元のオブジェクトからの処理の委譲に応えられるようにする
class TwoPersonsGameDelegate: GameDelegate {
    var numberOfPlayers: Int {
        return 2
    }
    func gameDidStart(_ game: Game) {
        print("Game start")
    }
    func gameDidEnd(_ game: Game) {
        print("Game end")
    }
}

// デリゲート元のオブジェクトのクラス
class Game {
    // デリゲート先のオブジェクトをプロパティとして持つ
    // Swiftではプロトコルも型として扱うことができるので、
    // GameDelegateプロトコルに準拠した型であればなんでも代入できる
    weak var delegate: GameDelegate?
    
    func start() {
        // delegateプロパティを通じて、デリゲート先にプレイヤーの人数を問い合わせる
        print("Number of players is \(delegate?.numberOfPlayers ?? 1)")
        // delegateプロパティを通じて、デリゲート先のメソッド（gameDidStart）を実行して処理を委譲する
        delegate?.gameDidStart(self)
        print("Now Playing...")
        // delegateプロパティを通じて、デリゲート先のメソッド（gameDidEnd）を実行して処理を委譲する
        delegate?.gameDidEnd(self)
    }
}

// 上記の型を利用して実際の処理を行う
// デリゲート先のオブジェクトを生成
let delegate = TwoPersonsGameDelegate()
// デリゲート元のオブジェクトを生成
let twoPersonsGame = Game()
// delegateプロパティに委譲先のオプジェクトを設定
twoPersonsGame.delegate = delegate
// デリゲート元のメソッドのを実行
twoPersonsGame.start()
