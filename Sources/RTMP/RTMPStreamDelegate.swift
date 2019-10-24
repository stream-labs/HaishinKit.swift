import AVFoundation
import CoreMedia

public protocol RTMPStreamDelegate: class {
    func didPublishInsufficientBW(_ stream: RTMPStream, withConnection: RTMPConnection)
    func didPublishSufficientBW(_ stream: RTMPStream, withConnection: RTMPConnection)
    func didOutputAudio(_ buffer: AVAudioPCMBuffer, presentationTimeStamp: CMTime)
    func didOutputVideo(_ buffer: CMSampleBuffer)
    func clear()
    
    func didChangeReadyState(_ state: RTMPStream.ReadyState)

	func didChangeStreamInfo(_ stream: RTMPStream)
}

public extension RTMPStreamDelegate {
    func didOutputAudio(_ buffer: AVAudioPCMBuffer, presentationTimeStamp: CMTime) {
    }
    func didOutputVideo(_ buffer: CMSampleBuffer) {
    }
}
