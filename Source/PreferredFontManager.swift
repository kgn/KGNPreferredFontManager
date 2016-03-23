//
//  PreferredFontManager.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

internal let PreferredFontManagerDidChangeNotification = "PreferredFontManagerDidChangeNotification"
internal let PreferredFontManagerObjectKey = "PreferredFontManagerObjectKey"
internal let PreferredFontManagerTextStyleKey = "PreferredFontManagerTextStyleKey"

public class PreferredFontManager: NSObject {

    private static let privateSharedManager = PreferredFontManager()

    ///  A shared preferred font manager object to use
    public static func sharedManager() -> PreferredFontManager {
        return self.privateSharedManager
    }

    /**
    Register a font for a given text style with the font name, base size, and increment/decrement values.

    - Parameter style: The text style for which to return a font. See "Text Styles" in `UIFontDescriptor Class Reference` for recognized values.
    - Parameter fontName: The fully specified name of the font. This name incorporates both the font family name and the specific style information for the font.
    - Parameter baseFontSize: The base size (in points) to be used by the `UIContentSizeCategoryLarge` size category.
    - Parameter increment: The size (in points) to increment the baseFontSize by, from the `UIContentSizeCategoryExtraLarge` size category and up.
    - Parameter decrement: The size (in points) to decrement the baseFontSize by, from the `UIContentSizeCategoryMedium` size category and down.
    - Parameter includeAccessibilitySizes: Defaults to false, meaning that all of the additional accesability size categories will used the same font size as the `UIContentSizeCategoryExtraExtraExtraLarge` size category.
    If set to true the font size is incremented all the way up to the `UIContentSizeCategoryAccessibilityExtraExtraExtraLarge` size category.
    */
    public func registerFontsForTextStyle(style: String, fontName: String?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
        self.registerFontsForTextStyle(style, fontName: fontName, fontWeight: nil, baseFontSize: baseFontSize, increment: increment, decrement: decrement, includeAccessibilitySizes: includeAccessibilitySizes)
    }

    /**
    Register a font for a given text style with the font weight, base size, and increment/decrement values.

    - Parameter style: The text style for which to return a font. See "Text Styles" in `UIFontDescriptor Class Reference` for recognized values.
    - Parameter fontWeight: The font weight to use. See the `UIFontWeight...` constants in `UIFontDescriptor.h` for suggested values.
    - Parameter baseFontSize: The base size (in points) to be used by the `UIContentSizeCategoryLarge` size category.
    - Parameter increment: The size (in points) to increment the baseFontSize by, from the `UIContentSizeCategoryExtraLarge` size category and up.
    - Parameter decrement: The size (in points) to decrement the baseFontSize by, from the `UIContentSizeCategoryMedium` size category and down.
    - Parameter includeAccessibilitySizes: Defaults to false, meaning that all of the additional accesability size categories will used the same font size as the `UIContentSizeCategoryExtraExtraExtraLarge` size category.
    If set to true the font size is incremented all the way up to the `UIContentSizeCategoryAccessibilityExtraExtraExtraLarge` size category.
    */
    @available(iOS 8.2, *)
    public func registerFontsForTextStyle(style: String, fontWeight: CGFloat?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
        self.registerFontsForTextStyle(style, fontName: nil, fontWeight: fontWeight, baseFontSize: baseFontSize, increment: increment, decrement: decrement, includeAccessibilitySizes: includeAccessibilitySizes)
    }

    /**
    Returns the font object for a given text style.

    - Parameter style: The text style for which to return a font. See "Text Styles" in `UIFontDescriptor Class Reference` for recognized values.
    - Parameter sizeCategory: An optional sizeCategory, by default the value is retrieved from `UIApplication.sharedApplication().preferredContentSizeCategory`.
    - Returns: The font object.
    */
    public func preferredFontForTextStyle(style: String, sizeCategory: String? = nil) -> UIFont? {
        var innerSizeCategory: String? = sizeCategory ?? UIApplication.sharedApplication().preferredContentSizeCategory
        if innerSizeCategory == nil || innerSizeCategory == "" {
            innerSizeCategory = UIContentSizeCategoryLarge
        }
        if let sizes = self.fonts[style], font = sizes[innerSizeCategory!] {
            return font
        }
        return nil
    }

    // MARK: - Private

    private var fonts: [String: [String: UIFont?]] = [:]
    private let fontSizes = [UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium,
        UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge,
        UIContentSizeCategoryExtraExtraExtraLarge]
    private let accessibilityFontSizes = [UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge,
        UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge,
        UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]

    // TODO: make this lazy
    private func registerFontsForTextStyle(style: String, fontName: String?, fontWeight: CGFloat?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
        var fonts: [String: UIFont?] = [:]
        let middleIndex = floor(CGFloat(self.fontSizes.count)/2.0)

        for (index, fontSize) in self.fontSizes.enumerate() {
            var size = CGFloat(index)-middleIndex
            if size < 0 {
                size *= decrement
            } else {
                size *= increment
            }
            size = round(size+baseFontSize)

            if fontName != nil {
                fonts[fontSize] = UIFont(name: fontName!, size: size)
            } else if fontWeight != nil {
                if #available(iOS 8.2, *) {
                    fonts[fontSize] = UIFont.systemFontOfSize(size, weight: fontWeight!)
                } else {
                    assert(true, "Only supported on iOS 8.2+")
                    return
                }
            }
        }

        for (index, fontSize) in self.accessibilityFontSizes.enumerate() {
            var offset = -1
            if includeAccessibilitySizes {
                offset = index
            }
            let size = (CGFloat(offset+self.fontSizes.count)-middleIndex)*increment+baseFontSize

            if fontName != nil {
                fonts[fontSize] = UIFont(name: fontName!, size: size)
            } else if fontWeight != nil {
                if #available(iOS 8.2, *) {
                    fonts[fontSize] = UIFont.systemFontOfSize(size, weight: fontWeight!)
                } else {
                    assert(true, "Only supported on iOS 8.2+")
                    return
                }
            }
        }

        self.fonts[style] = fonts

        let object = [PreferredFontManagerObjectKey: self, PreferredFontManagerTextStyleKey: style]
        NSNotificationCenter.defaultCenter().postNotificationName(PreferredFontManagerDidChangeNotification, object: object)
    }
}
