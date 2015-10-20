# KGNPreferredFontManager

Helper class to registering custom fonts for `UIFontTextStyle`. 

[![iOS 8.0+](http://img.shields.io/badge/iOS-8.0%2B-blue.svg)]()
[![Xcode 7.0](http://img.shields.io/badge/Xcode-7.0-blue.svg)]()
[![Swift 2.0](http://img.shields.io/badge/Swift-2.0-blue.svg)]()
[![Release](https://img.shields.io/github/release/kgn/KGNPreferredFontManager.svg)](/releases)
[![Build Status](http://img.shields.io/badge/License-MIT-lightgrey.svg)](/LICENSE)

[![Build Status](https://travis-ci.org/kgn/KGNPreferredFontManager.svg)](https://travis-ci.org/kgn/KGNPreferredFontManager)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-Compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/KGNPreferredFontManager.svg)](https://cocoapods.org/pods/KGNPreferredFontManager)
[![CocoaPods Platforms](https://img.shields.io/cocoapods/p/KGNPreferredFontManager.svg)](https://cocoapods.org/pods/KGNPreferredFontManager)

[![Twitter](https://img.shields.io/badge/Twitter-@iamkgn-55ACEE.svg)](http://twitter.com/iamkgn)
[![Star](https://img.shields.io/github/followers/kgn.svg?style=social&label=Follow%20%40kgn)](https://github.com/kgn)
[![Star](https://img.shields.io/github/stars/kgn/KGNPreferredFontManager.svg?style=social&label=Star)](https://github.com/kgn/KGNPreferredFontManager)

`iOS 7` introduced the concept of dynamic fonts for accessibility and readability. This library makes it easy to implement these features to help make your app more accessible and readable.

This library also helps keep the fonts in your app consistent by setting a strict set of fonts to use based on the text styles introduced in `iOS 7`.

Subclasses of `UILabel` and `UIButton` are also provided that work with these text styles and the `KGNPreferredFontManager` to automatically update and resize to the appropriate font size for the user’s text size and accessibility settings. It is recommended that [KGNAutoLayout](https://github.com/kgn/KGNAutoLayout) be used in conjunction with this library so that elements resize and adjust appropriately as font sizes change.

[![Example Gif](https://d13yacurqjgara.cloudfront.net/users/7253/screenshots/1877784/fonts.gif)](https://dribbble.com/shots/1877784-Dynamic-Fonts)

## Installing

### Carthage
```
github "kgn/KGNPreferredFontManager"
```

### CocoaPods
```
pod 'KGNPreferredFontManager'
```

## Examples

### PreferredFontManager
Create a `PreferredFontManager` to specify the font sizes to be used when the user changes their accessibility settings. 

The following code registers each of the standard text styles with a `fontWeight` and `baseFontSize`. This base font size is used for the `UIContentSizeCategoryLarge` font size and then incremented and decremented by the amounts passed to the `increment` and `decrement` properties. 

There is an additional property that defines if the incrementing should extend into the extra accessibility size categories. This `includeAccessibilitySizes` argument is `false` by default, but is often useful to make sure body text is extra large, like in `Messages.app`.

There are two versions of this method. One takes `fontWeight: CGFloat`, which is a `UIFontWeight...` constant introduced in `iOS 8.2`. The other takes `fontName: String` which is a the name of the font, either a system one or a custom one.

#### fontWeight(iOS 8.2+)
Check out the Example app provided to see this in action.

``` Swift
let preferredFontManager = PreferredFontManager()
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleHeadline, fontWeight: UIFontWeightUltraLight, baseFontSize: UIFont.systemFontSize()*4, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleSubheadline, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize()*2, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleBody, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.labelFontSize(), increment: 2, decrement: 1, includeAccessibilitySizes: true)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption1, fontWeight: UIFontWeightMedium, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption2, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleFootnote, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.smallSystemFontSize(), increment: 1, decrement: 1)
```

#### fontName

``` Swift
let preferredFontManager = PreferredFontManager()
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleHeadline, fontName: "AvenirNext-Light", baseFontSize: 28, increment: 2, decrement: 2)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleSubheadline, fontName: "AvenirNext-Regular", baseFontSize: 22, increment: 2, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleBody, fontName: "AvenirNext-Regular", baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption1, fontName: "AvenirNext-Medium", baseFontSize: 15, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption2, fontName: "AvenirNext-Regular", baseFontSize: 13, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleFootnote, fontName: "AvenirNext-Regular", baseFontSize: 11, increment: 1, decrement: 1)
```

### PreferredFontButton & PreferredFontLabel
`PreferredFontButton` and `PreferredFontLabel` are subclasses of `UIButton` and `UILabel` respectively but they incorporate a `PreferredFontManager` and subscribe to `UIContentSizeCategoryDidChangeNotification` so the font used it automatically updated for the selected accessibility font size selected buy the user.

``` Swift
let label = PreferredFontLabel()
let button = PreferredFontButton()
```

#### Property: textStyle
By default the `UIFontTextStyleBody` is used, but this can be customized and changed at any time with the `textStyle:` initializer or the `.textStyle` property.

``` Swift
let label = PreferredFontLabel(textStyle: UIFontTextStyleHeadline)
let button = PreferredFontButton(textStyle: UIFontTextStyleHeadline)
```

#### Property: preferredFontManager
By default the `UIFont.preferredFontForTextStyle` is used to determine which font to use, but this can be customized by setting the `preferredFontManager` property. It is recommended to have one `PreferredFontManager` and use it for all labels, buttons and other text items.

``` Swift
let label = PreferredFontLabel()
label.preferredFontManager = App.PreferredFontManager

let button = PreferredFontButton()
button.preferredFontManager = App.PreferredFontManager
```

## Progress:
- [ ] Tests (Figure how to exclude `fontWeight` tests on `iOS 8.1`)
- [X] Travis
- [X] Badges
- [X] Carthage
- [X] CocoaPods
- [X] Description
- [X] Documentation
