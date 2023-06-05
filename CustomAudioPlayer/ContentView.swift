//
//  ContentView.swift
//  CustomAudioPlayer
//
//  Created by kimhongpil on 2023/06/02.
//

import SwiftUI

/**
 * [Ref]
 * - https://yurimac.tistory.com/57
 * - https://www.advancedswift.com/play-a-sound-in-swift/
 */
struct ContentView: View {
    @StateObject var audioPlayerViewModel = CustomAudioViewModel()
    @State private var trimURL: URL?
    @State private var combineURL: URL?
    
    var body: some View {
        VStack {
            Text("Play").font(.system(size: 45)).font(.largeTitle)
            HStack {
                Spacer()
                Button(action: {
                    audioPlayerViewModel.playAudio()
                }) {
                    Image(systemName: "play.circle.fill").resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                
                Button(action: {
                    audioPlayerViewModel.pauseAudio()
                }) {
                    Image(systemName: "pause.circle.fill").resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }
        }
        .onAppear {
            audioPlayerViewModel.setAudio()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
