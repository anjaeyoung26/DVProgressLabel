import XCTest
import DVProgressLabel

class Tests: XCTestCase {
  private var sut: DVProgressLabel!
  
  override func setUp() {
    super.setUp()
    
    sut = DVProgressLabel()
    sut.text = "Text"
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testRefreshProgressMask() {
    // Given
    sut.update(progress: 0.1)
    
    // When
    sut.refreshProgressMask()
    
    // Then
    XCTAssertNil(sut.currentMaskLayer)
    XCTAssertEqual(sut.progress, 0)
  }
  
  func testMaskLayerAttributedStringValues() throws {
    // Given
    sut.maskStrokeWidth = -2.0
    sut.maskStrokeColor = .red
    sut.maskColor = .orange
    
    // When
    sut.update(progress: 0.1)
    
    // Then
    let maskLayer = try XCTUnwrap(sut.currentMaskLayer)
    let attributedString = try XCTUnwrap(maskLayer.string as? NSAttributedString)
    let attributes = attributedString.attributes(at: 0, effectiveRange: nil)
    
    let foregroundColor = attributes[.foregroundColor] as? UIColor
    let strokeColor = attributes[.strokeColor] as? UIColor
    let strokeWidth = attributes[.strokeWidth] as? CGFloat
    
    XCTAssertEqual(foregroundColor, .orange)
    XCTAssertEqual(strokeColor, .red)
    XCTAssertEqual(strokeWidth, -2.0)
  }
  
  func testDidFinishMaskingSetCorrectlyValueWhenUpdateProgress() {
    // Given
    var didFinishMaskingForGreaterThanOne: Bool = false
    var didFinishMaskingForLessThanOne: Bool = false
    var didFinishMaskingForOne: Bool = false
    
    // When
    sut.update(progress: 1.5) {
      didFinishMaskingForGreaterThanOne = self.sut.didFinishMasking
    }
    
    sut.update(progress: 0.5) {
      didFinishMaskingForLessThanOne = self.sut.didFinishMasking
    }
    
    sut.update(progress: 1.0) {
      didFinishMaskingForOne = self.sut.didFinishMasking
    }
    
    // Then
    XCTAssertTrue(didFinishMaskingForGreaterThanOne)
    XCTAssertFalse(didFinishMaskingForLessThanOne)
    XCTAssertTrue(didFinishMaskingForOne)
  }
}
