//
//  PreferredFontManager.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

class PreferredFontManager: NSObject {
    private var fonts: [String: [String: UIFont?]] = [:]

    func registerFontsForTextStyle(style: String, fontName: String, baseFontSize: Double, increment: Double, decrement: Double, includeAccessibilitySizes: Bool = false) {
        let fontSizes = [UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium,
            UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge,
            UIContentSizeCategoryExtraExtraExtraLarge]
        let accessibilityFontSizes = [UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge,
            UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge,
            UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]

        var fonts: [String: UIFont?] = [:]
        let middleIndex = floor(Double(fontSizes.count)/2.0)

        for (index, fontSize) in enumerate(fontSizes) {
            var size = Double(index)-middleIndex
            if size < 0 {
                size *= decrement
            } else {
                size *= increment
            }
            size = round(size+baseFontSize)
            fonts[fontSize] = UIFont(name: fontName, size: CGFloat(size))
        }

        for (index, fontSize) in enumerate(accessibilityFontSizes) {
            var offset = -1
            if includeAccessibilitySizes {
                offset = index
            }
            let size = (Double(offset+fontSizes.count)-middleIndex)*increment+baseFontSize
            fonts[fontSize] = UIFont(name: fontName, size: CGFloat(size))
        }

        self.fonts[style] = fonts
    }

    func preferredFontForTextStyle(style: String) -> UIFont? {
        let sizeCategory = UIApplication.sharedApplication().preferredContentSizeCategory as String
        if let sizes = self.fonts[style] {
            if let font = sizes[sizeCategory] {
                return font
            }
        }
        return nil
    }
}
