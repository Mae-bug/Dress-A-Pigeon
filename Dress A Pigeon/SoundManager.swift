import AVFoundation

class SoundManager {
    static let shared = SoundManager()

    private var players: [String: AVAudioPlayer] = [:]

    private init() {}

    func playSound(name: String, type: String, loop: Bool = false) {
        stopSound(name: name)

        if let path = Bundle.main.path(forResource: name, ofType: type) {
            do {
                let player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player.prepareToPlay()
                player.numberOfLoops = loop ? -1 : 0
                player.play()
                players[name] = player
            } catch {
                print("Error playing sound \(name): \(error.localizedDescription)")
            }
        }
    }

    func stopSound(name: String) {
        players[name]?.stop()
        players[name] = nil
    }

    func stopAllSounds() {
        for (_, player) in players {
            player.stop()
        }
        players.removeAll()
    }
}
