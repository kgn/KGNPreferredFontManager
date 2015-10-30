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
        let button = PreferredFontButton(type: .System)
        view.addSubview(button)

        XCTAssertEqual(button.textStyle, UIFontTextStyleBody)
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(UIFontTextStyleBody))
    }

}

@available(iOS 8.2, *)
class KGNPreferredFontManagerFontWeightTests: XCTestCase {

    // for some reason @available(iOS 8.2, *) is not working
    func canRun() -> Bool {
        if NSProcessInfo.processInfo().operatingSystemVersion.majorVersion >= 9 {
            return true
        }
        if NSProcessInfo.processInfo().operatingSystemVersion.majorVersion >= 8 {
            if NSProcessInfo.processInfo().operatingSystemVersion.minorVersion >= 2 {
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
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 22,
            UIContentSizeCategorySmall: 24,
            UIContentSizeCategoryMedium: 26,
            UIContentSizeCategoryLarge: 28,
            UIContentSizeCategoryExtraLarge: 30,
            UIContentSizeCategoryExtraExtraLarge: 32,
            UIContentSizeCategoryExtraExtraExtraLarge: 34,
            UIContentSizeCategoryAccessibilityMedium: 34,
            UIContentSizeCategoryAccessibilityLarge: 34,
            UIContentSizeCategoryAccessibilityExtraLarge: 34,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 34,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 34
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
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
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldHeadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleSubheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 19,
            UIContentSizeCategorySmall: 20,
            UIContentSizeCategoryMedium: 21,
            UIContentSizeCategoryLarge: 22,
            UIContentSizeCategoryExtraLarge: 24,
            UIContentSizeCategoryExtraExtraLarge: 26,
            UIContentSizeCategoryExtraExtraExtraLarge: 28,
            UIContentSizeCategoryAccessibilityMedium: 28,
            UIContentSizeCategoryAccessibilityLarge: 28,
            UIContentSizeCategoryAccessibilityExtraLarge: 28,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 28,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 28
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
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
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleSubheadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldSubheadline() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleSubheadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 14,
            UIContentSizeCategorySmall: 15,
            UIContentSizeCategoryMedium: 16,
            UIContentSizeCategoryLarge: 17,
            UIContentSizeCategoryExtraLarge: 18,
            UIContentSizeCategoryExtraExtraLarge: 19,
            UIContentSizeCategoryExtraExtraExtraLarge: 20,
            UIContentSizeCategoryAccessibilityMedium: 20,
            UIContentSizeCategoryAccessibilityLarge: 20,
            UIContentSizeCategoryAccessibilityExtraLarge: 20,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 20,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 20
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
        }
    }

    func testFontWeightBodyIncludeAccessibilitySizes() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 14,
            UIContentSizeCategorySmall: 15,
            UIContentSizeCategoryMedium: 16,
            UIContentSizeCategoryLarge: 17,
            UIContentSizeCategoryExtraLarge: 18,
            UIContentSizeCategoryExtraExtraLarge: 19,
            UIContentSizeCategoryExtraExtraExtraLarge: 20,
            UIContentSizeCategoryAccessibilityMedium: 21,
            UIContentSizeCategoryAccessibilityLarge: 22,
            UIContentSizeCategoryAccessibilityExtraLarge: 23,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 24,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 25
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
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
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldBody() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 17, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 12,
            UIContentSizeCategorySmall: 13,
            UIContentSizeCategoryMedium: 14,
            UIContentSizeCategoryLarge: 15,
            UIContentSizeCategoryExtraLarge: 16,
            UIContentSizeCategoryExtraExtraLarge: 17,
            UIContentSizeCategoryExtraExtraExtraLarge: 18,
            UIContentSizeCategoryAccessibilityMedium: 18,
            UIContentSizeCategoryAccessibilityLarge: 18,
            UIContentSizeCategoryAccessibilityExtraLarge: 18,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 18,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 18
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
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
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldCaption1() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 15, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 10,
            UIContentSizeCategorySmall: 11,
            UIContentSizeCategoryMedium: 12,
            UIContentSizeCategoryLarge: 13,
            UIContentSizeCategoryExtraLarge: 14,
            UIContentSizeCategoryExtraExtraLarge: 15,
            UIContentSizeCategoryExtraExtraExtraLarge: 16,
            UIContentSizeCategoryAccessibilityMedium: 16,
            UIContentSizeCategoryAccessibilityLarge: 16,
            UIContentSizeCategoryAccessibilityExtraLarge: 16,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 16,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 16
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
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
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldCaption2() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 13, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 8,
            UIContentSizeCategorySmall: 9,
            UIContentSizeCategoryMedium: 10,
            UIContentSizeCategoryLarge: 11,
            UIContentSizeCategoryExtraLarge: 12,
            UIContentSizeCategoryExtraExtraLarge: 13,
            UIContentSizeCategoryExtraExtraExtraLarge: 14,
            UIContentSizeCategoryAccessibilityMedium: 14,
            UIContentSizeCategoryAccessibilityLarge: 14,
            UIContentSizeCategoryAccessibilityExtraLarge: 14,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 14,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 14
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont.systemFontOfSize(fontSize, weight: fontWeight))
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
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldFootnote() {
        if !self.canRun() {
            return
        }

        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontWeight: fontWeight, baseFontSize: 11, increment: 2, decrement: 1)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }
    
}

class KGNPreferredFontManagerFontNameTests: XCTestCase {

    func testFontWeightHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 22,
            UIContentSizeCategorySmall: 24,
            UIContentSizeCategoryMedium: 26,
            UIContentSizeCategoryLarge: 28,
            UIContentSizeCategoryExtraLarge: 30,
            UIContentSizeCategoryExtraExtraLarge: 32,
            UIContentSizeCategoryExtraExtraExtraLarge: 34,
            UIContentSizeCategoryAccessibilityMedium: 34,
            UIContentSizeCategoryAccessibilityLarge: 34,
            UIContentSizeCategoryAccessibilityExtraLarge: 34,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 34,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 34
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldHeadline() {
        let fontName = "AvenirNext-UltraLight"
        let textStyle = UIFontTextStyleHeadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 28, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 19,
            UIContentSizeCategorySmall: 20,
            UIContentSizeCategoryMedium: 21,
            UIContentSizeCategoryLarge: 22,
            UIContentSizeCategoryExtraLarge: 24,
            UIContentSizeCategoryExtraExtraLarge: 26,
            UIContentSizeCategoryExtraExtraExtraLarge: 28,
            UIContentSizeCategoryAccessibilityMedium: 28,
            UIContentSizeCategoryAccessibilityLarge: 28,
            UIContentSizeCategoryAccessibilityExtraLarge: 28,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 28,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 28
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldSubheadline() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleSubheadline

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 22, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 17, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 14,
            UIContentSizeCategorySmall: 15,
            UIContentSizeCategoryMedium: 16,
            UIContentSizeCategoryLarge: 17,
            UIContentSizeCategoryExtraLarge: 18,
            UIContentSizeCategoryExtraExtraLarge: 19,
            UIContentSizeCategoryExtraExtraExtraLarge: 20,
            UIContentSizeCategoryAccessibilityMedium: 20,
            UIContentSizeCategoryAccessibilityLarge: 20,
            UIContentSizeCategoryAccessibilityExtraLarge: 20,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 20,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 20
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testFontWeightBodyIncludeAccessibilitySizes() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 14,
            UIContentSizeCategorySmall: 15,
            UIContentSizeCategoryMedium: 16,
            UIContentSizeCategoryLarge: 17,
            UIContentSizeCategoryExtraLarge: 18,
            UIContentSizeCategoryExtraExtraLarge: 19,
            UIContentSizeCategoryExtraExtraExtraLarge: 20,
            UIContentSizeCategoryAccessibilityMedium: 21,
            UIContentSizeCategoryAccessibilityLarge: 22,
            UIContentSizeCategoryAccessibilityExtraLarge: 23,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 24,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 25
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldBody() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleBody

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 17, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 15, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 12,
            UIContentSizeCategorySmall: 13,
            UIContentSizeCategoryMedium: 14,
            UIContentSizeCategoryLarge: 15,
            UIContentSizeCategoryExtraLarge: 16,
            UIContentSizeCategoryExtraExtraLarge: 17,
            UIContentSizeCategoryExtraExtraExtraLarge: 18,
            UIContentSizeCategoryAccessibilityMedium: 18,
            UIContentSizeCategoryAccessibilityLarge: 18,
            UIContentSizeCategoryAccessibilityExtraLarge: 18,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 18,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 18
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldCaption1() {
        let fontName = "AvenirNext-Medium"
        let textStyle = UIFontTextStyleCaption1

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 15, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 13, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 10,
            UIContentSizeCategorySmall: 11,
            UIContentSizeCategoryMedium: 12,
            UIContentSizeCategoryLarge: 13,
            UIContentSizeCategoryExtraLarge: 14,
            UIContentSizeCategoryExtraExtraLarge: 15,
            UIContentSizeCategoryExtraExtraExtraLarge: 16,
            UIContentSizeCategoryAccessibilityMedium: 16,
            UIContentSizeCategoryAccessibilityLarge: 16,
            UIContentSizeCategoryAccessibilityExtraLarge: 16,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 16,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 16
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldCaption2() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleCaption2

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 13, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testFontWeightFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 11, increment: 1, decrement: 1)

        let sizes: [String: CGFloat] = [
            UIContentSizeCategoryExtraSmall: 8,
            UIContentSizeCategorySmall: 9,
            UIContentSizeCategoryMedium: 10,
            UIContentSizeCategoryLarge: 11,
            UIContentSizeCategoryExtraLarge: 12,
            UIContentSizeCategoryExtraExtraLarge: 13,
            UIContentSizeCategoryExtraExtraExtraLarge: 14,
            UIContentSizeCategoryAccessibilityMedium: 14,
            UIContentSizeCategoryAccessibilityLarge: 14,
            UIContentSizeCategoryAccessibilityExtraLarge: 14,
            UIContentSizeCategoryAccessibilityExtraExtraLarge: 14,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: 14
        ]

        for (sizeCategory, fontSize) in sizes {
            let extraSmallPreferredFont = preferredFontManager.preferredFontForTextStyle(textStyle, sizeCategory: sizeCategory)
            XCTAssertEqual(extraSmallPreferredFont, UIFont(name: fontName, size: fontSize))
        }
    }

    func testLabelFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote

        let label = PreferredFontLabel(textStyle: textStyle)
        label.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(label.font, UIFont.preferredFontForTextStyle(textStyle))

        label.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(label.font, label.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testButtonFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote

        let button = PreferredFontButton(textStyle: textStyle)
        button.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(button.titleLabel?.font, UIFont.preferredFontForTextStyle(textStyle))

        button.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(button.titleLabel?.font, button.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }

    func testTextFieldFootnote() {
        let fontName = "AvenirNext-Regular"
        let textStyle = UIFontTextStyleFootnote

        let textField = PreferredFontTextField(textStyle: textStyle)
        textField.preferredFontManager = PreferredFontManager()
        XCTAssertEqual(textField.font, UIFont.preferredFontForTextStyle(textStyle))

        textField.preferredFontManager?.registerFontsForTextStyle(textStyle, fontName: fontName, baseFontSize: 11, increment: 2, decrement: 2)

        XCTAssertEqual(textField.font, textField.preferredFontManager?.preferredFontForTextStyle(textStyle))
    }
    
}
