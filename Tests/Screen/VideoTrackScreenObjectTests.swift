import Foundation
import Testing
import AVFoundation

@testable import HaishinKit

@Suite struct VideoTrackObjectContainerTests {
    /*
    func testHorizontalAlignmentBounds() {
        let screen = Screen()
            
        let object1 = VideoTrackScreenObject()
        object1.videoGravity = .resizeAspect
        object1.size = .init(width: 160, height: 90)
        object1.enqueue(CMVideoSampleBufferFactory.makeSampleBuffer(width: 900, height: 1600)!)
        object1.horizontalAlignment = .left
            
        let object2 = VideoTrackScreenObject()
        object2.videoGravity = .resizeAspect
        object2.size = .init(width: 160, height: 90)
        object2.enqueue(CMVideoSampleBufferFactory.makeSampleBuffer(width: 900, height: 1600)!)
        object2.horizontalAlignment = .center
            
        let object3 = VideoTrackScreenObject()
        object3.videoGravity = .resizeAspect
        object3.size = .init(width: 160, height: 90)
        object3.enqueue(CMVideoSampleBufferFactory.makeSampleBuffer(width: 900, height: 1600)!)
        object3.horizontalAlignment = .right
            
        try? screen.addChild(object1)
        try? screen.addChild(object2)
        try? screen.addChild(object3)
            
        if let sampleBuffer = CMVideoSampleBufferFactory.makeSampleBuffer(width: 1600, height: 900) {
            _ = screen.render(sampleBuffer)
        }
            
        XCTAssertEqual(object1.bounds, .init(x: 0, y: 0, width: 50.625, height: 90))
        XCTAssertEqual(object2.bounds, .init(x: 774.6875, y: 0, width: 50.625, height: 90))
        XCTAssertEqual(object3.bounds, .init(x: 1549.375, y: 0, width: 50.625, height: 90))
    }
    */
}
