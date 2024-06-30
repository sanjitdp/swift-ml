/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI
import AVFoundation

struct TranscriptTest: View {
    @StateObject var liveSpeechRecognizer = LiveSpeechRecognizer()
    @StateObject var offlineSpeechRecognizer = OfflineSpeechRecognizer()
    @State private var isRecording = false
    @State private var liveTranscript = ""
    @State private var url = ""
    
    
    var body: some View {
        VStack {
            Button("Start Recording", action: {
                print("Started transcribing")
                startLiveTranscription()
            })
            Button("End Recording", action: {
                print("Ended transcribing")
                endLiveTranscription()
            })
            Text("Transcript: " + liveTranscript)
            
//            TextField("URL", text: $url)
        }
    }
    
    private func startLiveTranscription() {
        liveSpeechRecognizer.resetTranscript()
        liveSpeechRecognizer.startTranscribing()
        isRecording = true
    }
    
    private func endLiveTranscription() {
        liveSpeechRecognizer.stopTranscribing()
        isRecording = false
        liveTranscript = liveSpeechRecognizer.transcript
        print("Live transcript:\n" + liveTranscript)
    }
    
    private func transcribeOffline(url: String) {
        offlineSpeechRecognizer.resetTranscript()
        offlineSpeechRecognizer.transcribe(url: url)
    }
}

struct TranscriptTestPreviews: PreviewProvider {
    static var previews: some View {
        TranscriptTest()
    }
}
