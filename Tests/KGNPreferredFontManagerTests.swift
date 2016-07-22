//
//  KGNPreferredFontManagerTests.swift
//  KGNPreferredFontManagerTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNPreferredFontManager

class KGNPreferredFontManagerPreferredFontButtonTests: XCTestCase {

    func testSystemButton() {
        let view = UIView()
        let button = PreferredFontButton(type: .system)
        view.addSubview(button)

        XCTAssertEqual(button.textStyle, UIFontTextStyleBody)
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: UIFontTextStyleBody))
    }

}

@available(iOS 8.2, *)
class KGNPreferredFontManagerFontWeightTests: XCTestCase {

    // for some reason @available(iOS 8.2, *) is not working
    func canRun() -> Bool {
        if ProcessInfo.processInfo.operatingSystemVersion.majorVersion >= 9 {
            return true
        }
        if ProcessInfo.processInfo.operatingSystemVersion.majorVersion >= 8 {
            if ProcessInfo.processInfo.operatingSystemVersion.minorVersion >= 2 {
                return true
            }
        }
        return false
    }

    func testFontWeightHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 22,
            ContentSizeCategory.small: 24,
            ContentSizeCategory.medium: 26,
            ContentSizeCategory.large: 28,
            ContentSizeCategory.extraLarge: 30,
            ContentSizeCategory.extraExtraLarge: 32,
            ContentSizeCategory.extraExtraExtraLarge: 34,
            ContentSizeCategory.accessibilityMedium: 34,
            ContentSizeCategory.accessibilityLarge: 34,
            ContentSizeCategory.accessibilityExtraLarge: 34,
            ContentSizeCategory.accessibilityExtraExtraLarge: 34,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 34
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testLabelHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleSubheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 19,
            ContentSizeCategory.small: 20,
            ContentSizeCategory.medium: 21,
            ContentSizeCategory.large: 22,
            ContentSizeCategory.extraLarge: 24,
            ContentSizeCategory.extraExtraLarge: 26,
            ContentSizeCategory.extraExtraExtraLarge: 28,
            ContentSizeCategory.accessibilityMedium: 28,
            ContentSizeCategory.accessibilityLarge: 28,
            ContentSizeCategory.accessibilityExtraLarge: 28,
            ContentSizeCategory.accessibilityExtraExtraLarge: 28,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 28
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testLabelSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleSubheadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleSubheadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleSubheadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 14,
            ContentSizeCategory.small: 15,
            ContentSizeCategory.medium: 16,
            ContentSizeCategory.large: 17,
            ContentSizeCategory.extraLarge: 18,
            ContentSizeCategory.extraExtraLarge: 19,
            ContentSizeCategory.extraExtraExtraLarge: 20,
            ContentSizeCategory.accessibilityMedium: 20,
            ContentSizeCategory.accessibilityLarge: 20,
            ContentSizeCategory.accessibilityExtraLarge: 20,
            ContentSizeCategory.accessibilityExtraExtraLarge: 20,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 20
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testFontWeightBodyIncludeAccessibilitySizes() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 14,
            ContentSizeCategory.small: 15,
            ContentSizeCategory.medium: 16,
            ContentSizeCategory.large: 17,
            ContentSizeCategory.extraLarge: 18,
            ContentSizeCategory.extraExtraLarge: 19,
            ContentSizeCategory.extraExtraExtraLarge: 20,
            ContentSizeCategory.accessibilityMedium: 21,
            ContentSizeCategory.accessibilityLarge: 22,
            ContentSizeCategory.accessibilityExtraLarge: 23,
            ContentSizeCategory.accessibilityExtraExtraLarge: 24,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 25
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testLabelBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 12,
            ContentSizeCategory.small: 13,
            ContentSizeCategory.medium: 14,
            ContentSizeCategory.large: 15,
            ContentSizeCategory.extraLarge: 16,
            ContentSizeCategory.extraExtraLarge: 17,
            ContentSizeCategory.extraExtraExtraLarge: 18,
            ContentSizeCategory.accessibilityMedium: 18,
            ContentSizeCategory.accessibilityLarge: 18,
            ContentSizeCategory.accessibilityExtraLarge: 18,
            ContentSizeCategory.accessibilityExtraExtraLarge: 18,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 18
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testLabelCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 10,
            ContentSizeCategory.small: 11,
            ContentSizeCategory.medium: 12,
            ContentSizeCategory.large: 13,
            ContentSizeCategory.extraLarge: 14,
            ContentSizeCategory.extraExtraLarge: 15,
            ContentSizeCategory.extraExtraExtraLarge: 16,
            ContentSizeCategory.accessibilityMedium: 16,
            ContentSizeCategory.accessibilityLarge: 16,
            ContentSizeCategory.accessibilityExtraLarge: 16,
            ContentSizeCategory.accessibilityExtraExtraLarge: 16,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 16
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testLabelCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 8,
            ContentSizeCategory.small: 9,
            ContentSizeCategory.medium: 10,
            ContentSizeCategory.large: 11,
            ContentSizeCategory.extraLarge: 12,
            ContentSizeCategory.extraExtraLarge: 13,
            ContentSizeCategory.extraExtraExtraLarge: 14,
            ContentSizeCategory.accessibilityMedium: 14,
            ContentSizeCategory.accessibilityLarge: 14,
            ContentSizeCategory.accessibilityExtraLarge: 14,
            ContentSizeCategory.accessibilityExtraExtraLarge: 14,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 14
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFont(ofSize: fontSize, weight: fontWeight))
        }
    }

    func testLabelFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }
    
}

class KGNPreferredFontManagerFontNameTests: XCTestCase {

    func testFontWeightHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 22,
            ContentSizeCategory.small: 24,
            ContentSizeCategory.medium: 26,
            ContentSizeCategory.large: 28,
            ContentSizeCategory.extraLarge: 30,
            ContentSizeCategory.extraExtraLarge: 32,
            ContentSizeCategory.extraExtraExtraLarge: 34,
            ContentSizeCategory.accessibilityMedium: 34,
            ContentSizeCategory.accessibilityLarge: 34,
            ContentSizeCategory.accessibilityExtraLarge: 34,
            ContentSizeCategory.accessibilityExtraExtraLarge: 34,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 34
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 19,
            ContentSizeCategory.small: 20,
            ContentSizeCategory.medium: 21,
            ContentSizeCategory.large: 22,
            ContentSizeCategory.extraLarge: 24,
            ContentSizeCategory.extraExtraLarge: 26,
            ContentSizeCategory.extraExtraExtraLarge: 28,
            ContentSizeCategory.accessibilityMedium: 28,
            ContentSizeCategory.accessibilityLarge: 28,
            ContentSizeCategory.accessibilityExtraLarge: 28,
            ContentSizeCategory.accessibilityExtraExtraLarge: 28,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 28
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 14,
            ContentSizeCategory.small: 15,
            ContentSizeCategory.medium: 16,
            ContentSizeCategory.large: 17,
            ContentSizeCategory.extraLarge: 18,
            ContentSizeCategory.extraExtraLarge: 19,
            ContentSizeCategory.extraExtraExtraLarge: 20,
            ContentSizeCategory.accessibilityMedium: 20,
            ContentSizeCategory.accessibilityLarge: 20,
            ContentSizeCategory.accessibilityExtraLarge: 20,
            ContentSizeCategory.accessibilityExtraExtraLarge: 20,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 20
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testFontWeightBodyIncludeAccessibilitySizes() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 14,
            ContentSizeCategory.small: 15,
            ContentSizeCategory.medium: 16,
            ContentSizeCategory.large: 17,
            ContentSizeCategory.extraLarge: 18,
            ContentSizeCategory.extraExtraLarge: 19,
            ContentSizeCategory.extraExtraExtraLarge: 20,
            ContentSizeCategory.accessibilityMedium: 21,
            ContentSizeCategory.accessibilityLarge: 22,
            ContentSizeCategory.accessibilityExtraLarge: 23,
            ContentSizeCategory.accessibilityExtraExtraLarge: 24,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 25
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 12,
            ContentSizeCategory.small: 13,
            ContentSizeCategory.medium: 14,
            ContentSizeCategory.large: 15,
            ContentSizeCategory.extraLarge: 16,
            ContentSizeCategory.extraExtraLarge: 17,
            ContentSizeCategory.extraExtraExtraLarge: 18,
            ContentSizeCategory.accessibilityMedium: 18,
            ContentSizeCategory.accessibilityLarge: 18,
            ContentSizeCategory.accessibilityExtraLarge: 18,
            ContentSizeCategory.accessibilityExtraExtraLarge: 18,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 18
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 10,
            ContentSizeCategory.small: 11,
            ContentSizeCategory.medium: 12,
            ContentSizeCategory.large: 13,
            ContentSizeCategory.extraLarge: 14,
            ContentSizeCategory.extraExtraLarge: 15,
            ContentSizeCategory.extraExtraExtraLarge: 16,
            ContentSizeCategory.accessibilityMedium: 16,
            ContentSizeCategory.accessibilityLarge: 16,
            ContentSizeCategory.accessibilityExtraLarge: 16,
            ContentSizeCategory.accessibilityExtraExtraLarge: 16,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 16
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testFontWeightFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            ContentSizeCategory.extraSmall: 8,
            ContentSizeCategory.small: 9,
            ContentSizeCategory.medium: 10,
            ContentSizeCategory.large: 11,
            ContentSizeCategory.extraLarge: 12,
            ContentSizeCategory.extraExtraLarge: 13,
            ContentSizeCategory.extraExtraExtraLarge: 14,
            ContentSizeCategory.accessibilityMedium: 14,
            ContentSizeCategory.accessibilityLarge: 14,
            ContentSizeCategory.accessibilityExtraLarge: 14,
            ContentSizeCategory.accessibilityExtraExtraLarge: 14,
            ContentSizeCategory.accessibilityExtraExtraExtraLarge: 14
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testButtonFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }

    func testTextFieldFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle))
    }
    
}
