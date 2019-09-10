// 型のネスト
// 型の中に型を定義する
// ネストされた型はネストする型の名前を引き継ぐことで、
// 型名をより明確かつ簡単にできる

struct Player {
    enum Job: String {
        case fighter
        case wizard
        case bishop
    }
    
    let id: Int
    var name: String
    var job: Job
}

let job = Player.Job.fighter
let player = Player(id: 1, name: "momon", job: job)
switch player.job {
case .fighter:
    print("My job is fighter!")
case .wizard:
    print("My job is wizard!")
case .bishop:
    print("My job is bishop!")
}
