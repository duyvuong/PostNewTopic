import XCTest
@testable import Aztec

class ItalicElementToAttributeConverterTests: XCTestCase {
    
    let converter = ItalicElementAttributesConverter()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - EditorView Properties
    
    func testSimpleItalicConversion() {
        
        let cssAttribute = CSSAttribute.italic
        let attribute = Attribute(type: .style, value: .inlineCss([cssAttribute]))
        let stringAttributes: [NSAttributedString.Key: Any] = [:]
        
        let finalAttributes = converter.convert(attribute, inheriting: stringAttributes)
        
        guard let font = finalAttributes[.font] as? UIFont else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(font.containsTraits(.traitItalic))
    }
    
    func testSimpleNonItalicConversion() {
        
        let cssAttribute = CSSAttribute.bold
        let attribute = Attribute(type: .style, value: .inlineCss([cssAttribute]))
        let stringAttributes: [NSAttributedString.Key: Any] = [:]
        
        let finalAttributes = converter.convert(attribute, inheriting: stringAttributes)
        let font = finalAttributes[.font] as? UIFont
        
        XCTAssertNil(font)
    }
}
