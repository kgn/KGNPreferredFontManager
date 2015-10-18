# KGNPreferredFontManager

Helper class to registering custom fonts for `UIFontTextStyle`.

[![iOS 8.2+](http://img.shields.io/badge/iOS-8.2%2B-blue.svg)]()
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

Check out the Example app provided to see all of this in action.

``` Swift
let preferredFontManager = PreferredFontManager()
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleHeadline, fontName: nil, fontWeight: UIFontWeightUltraLight, baseFontSize: UIFont.systemFontSize()*4, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleSubheadline, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize()*2, increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleBody, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.labelFontSize(), increment: 2, decrement: 1, includeAccessibilitySizes: true)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption1, fontName: nil, fontWeight: UIFontWeightMedium, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption2, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
preferredFontManager.registerFontsForTextStyle(UIFontTextStyleFootnote, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.smallSystemFontSize(), increment: 1, decrement: 1)
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

## TODO:
- [X] Tests
- [X] Travis
- [X] Badges
- [X] Carthage
- [ ] CocoaPods (Just need to publish)
- [X] Description
- [ ] Documentation (Add to code)
