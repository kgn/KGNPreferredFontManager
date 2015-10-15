[![iOS 8.2+](http://img.shields.io/badge/iOS-8.2%2B-blue.svg)]()
[![Xcode 7.0](http://img.shields.io/badge/Xcode-7.0-blue.svg)]()
[![Swift 2.0](http://img.shields.io/badge/Swift-2.0-blue.svg)]()
[![Release](http://img.shields.io/github/release/kgn/KGNPreferredFontManager.svg)](/releases)
[![Build Status](http://img.shields.io/badge/License-MIT-lightgrey.svg)](/LICENSE)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-Compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/kgn/KGNPreferredFontManager.svg)](https://travis-ci.org/kgn/KGNPreferredFontManager)
[![Twitter](https://img.shields.io/badge/Twitter-@iamkgn-55ACEE.svg)](http://twitter.com/iamkgn)

# Example

Checkout the `KGNPreferredFontManagerExample` app target for an example of how to use and customize your dynamic fonts.

``` swift
let preferredFontManager = PreferredFontManager()
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleHeadline, fontName: nil, fontWeight: UIFontWeightUltraLight, baseFontSize: UIFont.systemFontSize()*4, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleSubheadline, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize()*2, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleBody, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.labelFontSize(), increment: 2, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption1, fontName: nil, fontWeight: UIFontWeightMedium, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption2, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleFootnote, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.smallSystemFontSize(), increment: 1, decrement: 1)

let headlineLabel = PreferredFontLabel(textStyle: UIFontTextStyleHeadline)
headlineLabel.preferredFontManager = preferredFontManager
```
