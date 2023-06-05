//
//  CustomAudioViewModel.swift
//  CustomAudioPlayer
//
//  Created by kimhongpil on 2023/06/05.
//

import Foundation
import AVFoundation

class CustomAudioViewModel: ObservableObject {
    var player: AVAudioPlayer?
    
    func setAudio() {
        // async 타입 함수 호출시 Task 사용해야 됨
        // [Ref] https://www.hackingwithswift.com/quick-start/concurrency/how-to-fix-the-error-async-call-in-a-function-that-does-not-support-concurrency
        Task {
            if let NOdata = await self.getDataFrom(url: "https://audio.fantoo.co.kr/flower_test.mp3") {
                
                do {
                    player = try AVAudioPlayer(data: NOdata)
                    player?.numberOfLoops = -1  // Play this sound on loop forever
                } catch {
                    print("Failed to play mp3 file. error = \(error.localizedDescription)")
                }
            }
        }
    }
    
    /* 오디오 재생 */
    func playAudio() {
        player?.play()
    }
    
    func pauseAudio() {
        player?.pause()
    }
    
    /* URL로부터 Data를 얻는다. */
    func getDataFrom(url: String) async -> Data? {
        var data: Data?
        if let url = URL(string: url) {
            do {
                /**
                 * Data(contentsOf: ) 말고 URLSession 사용해야 됨
                 */
                //data = try Data(contentsOf: url)
                let (tmpData, _) = try await URLSession.shared.data(from: url)
                data = tmpData
            } catch {
                print("Failed to get data from url. error = \(error.localizedDescription)")
            }
        }
        return data
    }
}
