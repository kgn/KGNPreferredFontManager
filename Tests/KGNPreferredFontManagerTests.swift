//
//  KGNPreferredFontManagerTests.swift
//  KGNPreferredFontManagerTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNPreferredFontManager

class KGNPreferredFontManagerTests: XCTestCase {
    
    func testFontWeightHeadline() {
        let fontWeight = UIFontWeightUltraLight
        let textStyle = UIFontTextStyleHeadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 28, increment: 2, decrement: 2)

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

    func testFontWeightSubheadline() {
        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleSubheadline
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 22, increment: 2, decrement: 1)

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

    func testFontWeightBody() {
        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1)

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
        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleBody
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)

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

    func testFontWeightCaption1() {
        let fontWeight = UIFontWeightMedium
        let textStyle = UIFontTextStyleCaption1
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 15, increment: 1, decrement: 1)

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

    func testFontWeightCaption2() {
        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleCaption2
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 13, increment: 1, decrement: 1)

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

    func testFontWeightFootnote() {
        let fontWeight = UIFontWeightRegular
        let textStyle = UIFontTextStyleFootnote
        let preferredFontManager = PreferredFontManager()
        preferredFontManager.registerFontsForTextStyle(textStyle, fontName: nil, fontWeight: fontWeight, baseFontSize: 11, increment: 1, decrement: 1)

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
    
}
