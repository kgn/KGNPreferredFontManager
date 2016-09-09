# KGNPreferredFontManager

Helper class to registering custom fonts for `UIFontTextStyle`. 

[![Swift 3](http://img.shields.io/badge/Swift-3-orange.svg)]()
[![Release](https://img.shields.io/github/release/kgn/KGNPreferredFontManager.svg)](/releases)
[![License](http://img.shields.io/badge/License-MIT-lightgrey.svg)](/LICENSE)

[![Build Status](https://travis-ci.org/kgn/KGNPreferredFontManager.svg)](https://travis-ci.org/kgn/KGNPreferredFontManager)
[![Test Coverage](http://img.shields.io/badge/Tests-79%25-yellow.svg)]()
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
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .headline, fontWeight: UIFontWeightUltraLight, baseFontSize: UIFont.systemFontSize*4, increment: 1, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .subheadline, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize*2, increment: 1, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .body, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.labelFontSize, increment: 2, decrement: 1, includeAccessibilitySizes: true)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .caption1, fontWeight: UIFontWeightMedium, baseFontSize: UIFont.systemFontSize, increment: 1, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .caption2, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize, increment: 1, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .footnote, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.smallSystemFontSize, increment: 1, decrement: 1)
```

#### fontName

``` Swift
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .headline, fontName: "AvenirNext-Light", baseFontSize: 28, increment: 2, decrement: 2)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .subheadline, fontName: "AvenirNext-Regular", baseFontSize: 22, increment: 2, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .body, fontName: "AvenirNext-Regular", baseFontSize: 17, increment: 1, decrement: 1, includeAccessibilitySizes: true)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .caption1, fontName: "AvenirNext-Medium", baseFontSize: 15, increment: 1, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .caption2, fontName: "AvenirNext-Regular", baseFontSize: 13, increment: 1, decrement: 1)
PreferredFontManager.sharedManager.registerFonts(forTextStyle: .footnote, fontName: "AvenirNext-Regular", baseFontSize: 11, increment: 1, decrement: 1)
```

### PreferredFontButton, PreferredFontLabel & PreferredFontTextField
`PreferredFontButton`, `PreferredFontLabel` and `PreferredFontTextField` are subclasses of `UIButton`, `UILabel` and `UITextField`respectively but they incorporate a `PreferredFontManager` and subscribe to `UIContentSizeCategoryDidChangeNotification` so the font used it automatically updated for the selected accessibility font size selected buy the user.

``` Swift
let label = PreferredFontLabel()
let button = PreferredFontButton()
let textField = PreferredFontTextField()
```

#### Property: textStyle
By default the `UIFontTextStyle.body` is used, but this can be customized and changed at any time with the `textStyle:` initializer or the `.textStyle` property.

``` Swift
let label = PreferredFontLabel(textStyle: .headline)
let button = PreferredFontButton(textStyle: .headline)
let textField = PreferredFontTextField(textStyle: .headline)
```

#### Property: preferredFontManager
By default this property is set to `PreferredFontManager.shared`, if there is not a registered text style `UIFont.preferredFontForTextStyle` is used instead. This property can also be set to a custom `PreferredFontManager` object.

## Progress:
- [X] Tests
- [X] Travis
- [X] Badges
- [X] Carthage
- [X] CocoaPods
- [X] Description
- [X] Documentation
- [ ] AppleTV
- [X] Prebuilt Frameworks
- [ ] Travis Test Matrix
