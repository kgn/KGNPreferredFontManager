//
//  PreferredFontManager.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

public class PreferredFontManager: NSObject {
    public var sizeCategory: String?
    private var fonts: [String: [String: UIFont?]] = [:]
    private let fontSizes = [UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium,
        UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge,
        UIContentSizeCategoryExtraExtraExtraLarge]
    private let accessibilityFontSizes = [UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge,
        UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge,
        UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]

    public func registerFontsForTextStyle(style: String, fontName: String?, fontWeight: CGFloat?, baseFontSize: CGFloat, increment: CGFloat, decrement: CGFloat, includeAccessibilitySizes: Bool = false) {
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
                fonts[fontSize] = UIFont.systemFontOfSize(size, weight: fontWeight!)
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
                fonts[fontSize] = UIFont.systemFontOfSize(size, weight: fontWeight!)
            }
        }

        self.fonts[style] = fonts
    }

    public func preferredFontForTextStyle(style: String, sizeCategory: String? = nil) -> UIFont? {
        let sizeCategory = sizeCategory ?? self.sizeCategory ?? UIApplication.sharedApplication().preferredContentSizeCategory
        if let sizes = self.fonts[style], font = sizes[sizeCategory] {
            return font
        }
        return nil
    }
}
