//
//  PreferredFontManager.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

internal extension Notification.Name {
    
}

internal let PreferredFontManagerDidChangeNotification = "PreferredFontManagerDidChangeNotification"
internal let PreferredFontManagerObjectKey = "PreferredFontManagerObjectKey"
internal let PreferredFontManagerTextStyleKey = "PreferredFontManagerTextStyleKey"

public struct ContentSizeCategory {
    
    public static var defaultSize: String {
        return self.large
    }
    
    // TODO: figure out a way to get this working
    public static var preferredContentSizeCategory: String {
        return self.defaultSize
//        let preferredContentSizeCategory = UIApplication.shared().preferredContentSizeCategory as AnyObject
//        if preferredContentSizeCategory is String {
//            return preferredContentSizeCategory as! String
//        }
//        return UIApplication.shared().preferredContentSizeCategory.rawValue
    }
    
    public static var extraSmall: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.extraSmall.rawValue
        } else {
            return "UICTContentSizeCategoryXS"
        }
    }
    
    public static var small: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.small.rawValue
        } else {
            return "UICTContentSizeCategoryS"
        }
    }
    
    public static var medium: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.medium.rawValue
        } else {
            return "UICTContentSizeCategoryM"
        }
    }
    
    public static var large: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.large.rawValue
        } else {
            return "UICTContentSizeCategoryL"
        }
    }
    
    public static var extraLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.extraLarge.rawValue
        } else {
            return "UICTContentSizeCategoryXL"
        }
    }
    
    public static var extraExtraLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.extraExtraLarge.rawValue
        } else {
            return "UICTContentSizeCategoryXXL"
        }
    }
    
    public static var extraExtraExtraLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.extraExtraExtraLarge.rawValue
        } else {
            return "UICTContentSizeCategoryXXXL"
        }
    }
    
    public static var accessibilityMedium: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.accessibilityMedium.rawValue
        } else {
            return "UICTContentSizeCategoryAccessibilityM"
        }
    }
    
    public static var accessibilityLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.accessibilityLarge.rawValue
        } else {
            return "UICTContentSizeCategoryAccessibilityL"
        }
    }
    
    public static var accessibilityExtraLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.accessibilityExtraLarge.rawValue
        } else {
            return "UICTContentSizeCategoryAccessibilityXL"
        }
    }
    
    public static var accessibilityExtraExtraLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.accessibilityExtraExtraLarge.rawValue
        } else {
            return "UICTContentSizeCategoryAccessibilityXXL"
        }
    }
    
    public static var accessibilityExtraExtraExtraLarge: String {
        if #available(iOS 10, *) {
            return UIContentSizeCategory.accessibilityExtraExtraExtraLarge.rawValue
        } else {
            return "UICTContentSizeCategoryAccessibilityXXXL"
        }
    }
    
}

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
    public func registerFonts(forTextStyle style: String, fontName: String?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
        self.registerFonts(forTextStyle: style, fontName: fontName, fontWeight: nil, baseFontSize: baseFontSize, increment: increment, decrement: decrement, includeAccessibilitySizes: includeAccessibilitySizes)
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
    public func registerFonts(forTextStyle style: String, fontWeight: CGFloat?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
        self.registerFonts(forTextStyle: style, fontName: nil, fontWeight: fontWeight, baseFontSize: baseFontSize, increment: increment, decrement: decrement, includeAccessibilitySizes: includeAccessibilitySizes)
    }

    @available(iOS 10, *)
    public func preferredFont(forTextStyle style: String, sizeCategory: UIContentSizeCategory?) -> UIFont? {
        return self.preferredFont(forTextStyle: style, sizeCategory: sizeCategory?.rawValue)
    }
    
    /**
    Returns the font object for a given text style.

    - Parameter style: The text style for which to return a font. See "Text Styles" in `UIFontDescriptor Class Reference` for recognized values.
    - Parameter sizeCategory: An optional sizeCategory, by default the value is retrieved from `UIApplication.sharedApplication().preferredContentSizeCategory`.
    - Returns: The font object.
    */
    public func preferredFont(forTextStyle style: String, sizeCategory: String? = nil) -> UIFont? {
        let innerSizeCategory: String? = sizeCategory ?? ContentSizeCategory.preferredContentSizeCategory
        if let sizes = self.fonts[style], let font = sizes[innerSizeCategory!] {
            return font
        }
        return nil
    }

    // MARK: - Private

    private var fonts: [String: [String: UIFont?]] = [:]
    private let fontSizes = [ContentSizeCategory.extraSmall, ContentSizeCategory.small, ContentSizeCategory.medium,
        ContentSizeCategory.large, ContentSizeCategory.extraLarge, ContentSizeCategory.extraExtraLarge,
        ContentSizeCategory.extraExtraExtraLarge]
    private let accessibilityFontSizes = [ContentSizeCategory.accessibilityMedium, ContentSizeCategory.accessibilityLarge,
        ContentSizeCategory.accessibilityExtraLarge, ContentSizeCategory.accessibilityExtraExtraLarge,
        ContentSizeCategory.accessibilityExtraExtraExtraLarge]

    // TODO: make this lazy
    private func registerFonts(forTextStyle style: String, fontName: String?, fontWeight: CGFloat?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
        var fonts: [String: UIFont?] = [:]
        let middleIndex = floor(CGFloat(self.fontSizes.count)/2.0)

        for (index, fontSize) in self.fontSizes.enumerated() {
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
                    fonts[fontSize] = UIFont.systemFont(ofSize: size, weight: fontWeight!)
                } else {
                    assert(true, "Only supported on iOS 8.2+")
                    return
                }
            }
        }

        for (index, fontSize) in self.accessibilityFontSizes.enumerated() {
            var offset = -1
            if includeAccessibilitySizes {
                offset = index
            }
            let size = (CGFloat(offset+self.fontSizes.count)-middleIndex)*increment+baseFontSize

            if fontName != nil {
                fonts[fontSize] = UIFont(name: fontName!, size: size)
            } else if fontWeight != nil {
                if #available(iOS 8.2, *) {
                    fonts[fontSize] = UIFont.systemFont(ofSize: size, weight: fontWeight!)
                } else {
                    assert(true, "Only supported on iOS 8.2+")
                    return
                }
            }
        }

        self.fonts[style] = fonts

        let object = [PreferredFontManagerObjectKey: self, PreferredFontManagerTextStyleKey: style]
        NotificationCenter.default.post(name: Notification.Name(rawValue: PreferredFontManagerDidChangeNotification), object: object)
    }
}
