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

        XCTAssertEqual(button.textStyle, .body)
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: UIFontTextStyle.body))
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

        let fontWeight = UIFont.Weight.ultraLight
        let textStyle: UIFontTextStyle = .headline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 22,
            .small: 24,
            .medium: 26,
            .large: 28,
            .extraLarge: 30,
            .extraExtraLarge: 32,
            .extraExtraExtraLarge: 34,
            .accessibilityMedium: 34,
            .accessibilityLarge: 34,
            .accessibilityExtraLarge: 34,
            .accessibilityExtraExtraLarge: 34,
            .accessibilityExtraExtraExtraLarge: 34
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

        let fontWeight = UIFont.Weight.ultraLight
        let textStyle: UIFontTextStyle = .headline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.ultraLight
        let textStyle: UIFontTextStyle = .headline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.ultraLight
        let textStyle: UIFontTextStyle = .headline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .subheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 19,
            .small: 20,
            .medium: 21,
            .large: 22,
            .extraLarge: 24,
            .extraExtraLarge: 26,
            .extraExtraExtraLarge: 28,
            .accessibilityMedium: 28,
            .accessibilityLarge: 28,
            .accessibilityExtraLarge: 28,
            .accessibilityExtraExtraLarge: 28,
            .accessibilityExtraExtraExtraLarge: 28
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

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .subheadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .subheadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .subheadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .body
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .extraLarge: 18,
            .extraExtraLarge: 19,
            .extraExtraExtraLarge: 20,
            .accessibilityMedium: 20,
            .accessibilityLarge: 20,
            .accessibilityExtraLarge: 20,
            .accessibilityExtraExtraLarge: 20,
            .accessibilityExtraExtraExtraLarge: 20
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

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .body
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .extraLarge: 18,
            .extraExtraLarge: 19,
            .extraExtraExtraLarge: 20,
            .accessibilityMedium: 21,
            .accessibilityLarge: 22,
            .accessibilityExtraLarge: 23,
            .accessibilityExtraExtraLarge: 24,
            .accessibilityExtraExtraExtraLarge: 25
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

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .body

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .body

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .body

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .caption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 12,
            .small: 13,
            .medium: 14,
            .large: 15,
            .extraLarge: 16,
            .extraExtraLarge: 17,
            .extraExtraExtraLarge: 18,
            .accessibilityMedium: 18,
            .accessibilityLarge: 18,
            .accessibilityExtraLarge: 18,
            .accessibilityExtraExtraLarge: 18,
            .accessibilityExtraExtraExtraLarge: 18
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

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .caption1

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .caption1

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.medium
        let textStyle: UIFontTextStyle = .caption1

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .caption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 10,
            .small: 11,
            .medium: 12,
            .large: 13,
            .extraLarge: 14,
            .extraExtraLarge: 15,
            .extraExtraExtraLarge: 16,
            .accessibilityMedium: 16,
            .accessibilityLarge: 16,
            .accessibilityExtraLarge: 16,
            .accessibilityExtraExtraLarge: 16,
            .accessibilityExtraExtraExtraLarge: 16
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

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .caption2

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .caption2

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .caption2

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .footnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 8,
            .small: 9,
            .medium: 10,
            .large: 11,
            .extraLarge: 12,
            .extraExtraLarge: 13,
            .extraExtraExtraLarge: 14,
            .accessibilityMedium: 14,
            .accessibilityLarge: 14,
            .accessibilityExtraLarge: 14,
            .accessibilityExtraExtraLarge: 14,
            .accessibilityExtraExtraExtraLarge: 14
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

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .footnote

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .footnote

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFont.Weight.regular
        let textStyle: UIFontTextStyle = .footnote

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }
    
}

class KGNPreferredFontManagerFontNameTests: XCTestCase {

    func testFontWeightHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle: UIFontTextStyle = .headline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 22,
            .small: 24,
            .medium: 26,
            .large: 28,
            .extraLarge: 30,
            .extraExtraLarge: 32,
            .extraExtraExtraLarge: 34,
            .accessibilityMedium: 34,
            .accessibilityLarge: 34,
            .accessibilityExtraLarge: 34,
            .accessibilityExtraExtraLarge: 34,
            .accessibilityExtraExtraExtraLarge: 34
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle: UIFontTextStyle = .headline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle: UIFontTextStyle = .headline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle: UIFontTextStyle = .headline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .subheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 19,
            .small: 20,
            .medium: 21,
            .large: 22,
            .extraLarge: 24,
            .extraExtraLarge: 26,
            .extraExtraExtraLarge: 28,
            .accessibilityMedium: 28,
            .accessibilityLarge: 28,
            .accessibilityExtraLarge: 28,
            .accessibilityExtraExtraLarge: 28,
            .accessibilityExtraExtraExtraLarge: 28
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .subheadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .subheadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .subheadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .body
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .extraLarge: 18,
            .extraExtraLarge: 19,
            .extraExtraExtraLarge: 20,
            .accessibilityMedium: 20,
            .accessibilityLarge: 20,
            .accessibilityExtraLarge: 20,
            .accessibilityExtraExtraLarge: 20,
            .accessibilityExtraExtraExtraLarge: 20
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testFontWeightBodyIncludeAccessibilitySizes() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .body
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .extraLarge: 18,
            .extraExtraLarge: 19,
            .extraExtraExtraLarge: 20,
            .accessibilityMedium: 21,
            .accessibilityLarge: 22,
            .accessibilityExtraLarge: 23,
            .accessibilityExtraExtraLarge: 24,
            .accessibilityExtraExtraExtraLarge: 25
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .body

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .body

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .body

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle: UIFontTextStyle = .caption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 12,
            .small: 13,
            .medium: 14,
            .large: 15,
            .extraLarge: 16,
            .extraExtraLarge: 17,
            .extraExtraExtraLarge: 18,
            .accessibilityMedium: 18,
            .accessibilityLarge: 18,
            .accessibilityExtraLarge: 18,
            .accessibilityExtraExtraLarge: 18,
            .accessibilityExtraExtraExtraLarge: 18
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle: UIFontTextStyle = .caption1

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle: UIFontTextStyle = .caption1

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle: UIFontTextStyle = .caption1

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .caption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 10,
            .small: 11,
            .medium: 12,
            .large: 13,
            .extraLarge: 14,
            .extraExtraLarge: 15,
            .extraExtraExtraLarge: 16,
            .accessibilityMedium: 16,
            .accessibilityLarge: 16,
            .accessibilityExtraLarge: 16,
            .accessibilityExtraExtraLarge: 16,
            .accessibilityExtraExtraExtraLarge: 16
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .caption2

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .caption2

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .caption2

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testFontWeightFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .footnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 1, decrement: 1)

        let sizes: [UIContentSizeCategory: CGFloat] = [
            .extraSmall: 8,
            .small: 9,
            .medium: 10,
            .large: 11,
            .extraLarge: 12,
            .extraExtraLarge: 13,
            .extraExtraExtraLarge: 14,
            .accessibilityMedium: 14,
            .accessibilityLarge: 14,
            .accessibilityExtraLarge: 14,
            .accessibilityExtraExtraLarge: 14,
            .accessibilityExtraExtraExtraLarge: 14
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFont(forTextStyle: textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .footnote

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFont(forTextStyle: textStyle))

        label.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testButtonFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .footnote

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFont(forTextStyle: textStyle))

        button.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }

    func testTextFieldFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle: UIFontTextStyle = .footnote

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFont(forTextStyle: textStyle))

        textField.preferredFontManager?.registerFonts(forTextStyle: textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFont(forTextStyle: textStyle, sizeCategory: .medium))
    }
    
}
