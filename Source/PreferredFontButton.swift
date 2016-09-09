//
//  PreferredFontButton.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

private extension Selector {
    static let contentSizeCategoryDidChange = #selector(PreferredFontButton.contentSizeCategoryDidChange(notification:))
    static let preferredFontManagerDidChange = #selector(PreferredFontButton.preferredFontManagerDidChange(notification:))
}

/// Subclass of `UIButton` whos font is controlled by
/// the `textStyle` and `preferredFontManager` properties.
/// The font used is automaticly updated when the user changes
/// their accesability text size setting.
open class PreferredFontButton: UIButton {

    // TODO: before iOS 10 this may not behave as expected
    private var lastSizeCategory: UIContentSizeCategory = .medium
    private var sizeCategory: UIContentSizeCategory {
        if #available(iOSApplicationExtension 10.0, *) {
            // TODO: is this always unspecified
            if self.traitCollection.preferredContentSizeCategory != .unspecified {
                return self.traitCollection.preferredContentSizeCategory
            }
        }
        return self.lastSizeCategory
    }
    
    /// The text style to be used.
    /// Defaults to `UIFontTextStyleBody`.
    public var textStyle: UIFontTextStyle = .body {
        didSet {
            self.updateFont()
        }
    }

    /// The preferred font manager object to use.
    /// Defaults to `PreferredFontManager.sharedManager()`.
    public var preferredFontManager: PreferredFontManager? = PreferredFontManager.sharedManager {
        didSet {
            self.updateFont()
        }
    }

    private var hasMovedToSuperview = false
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()

        // HACK: The buttonType convenience init
        // cannot be overwritten, so this is a hack
        // to update the font when the button is
        // first moved to a superview
        if !self.hasMovedToSuperview && self.buttonType == .system {
            self.hasMovedToSuperview = true
            self.updateFont()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }


    /// Initialize a `PreferredFontButton` object with a given textStyle.
    public convenience init(textStyle: UIFontTextStyle) {
        self.init(frame: CGRect.zero)
        self.textStyle = textStyle
        self.updateFont()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    /// This `setup` method is called when initalized.
    /// Override this method to customize the setup of the button object.
    /// Be sure to call `super.setup()` in your implementation.
    public func setup() {
        self.updateFont()
        NotificationCenter.default.addObserver(
            self, selector: .contentSizeCategoryDidChange,
            name: .UIContentSizeCategoryDidChange, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: .preferredFontManagerDidChange,
            name: NSNotification.Name(rawValue: PreferredFontManagerDidChangeNotification), object: nil)
    }

    private func updateFont() {
        if let font = self.preferredFontManager?.preferredFont(forTextStyle: self.textStyle, sizeCategory: self.sizeCategory) {
            self.titleLabel?.font = font
        } else  {
            self.titleLabel?.font = UIFont.preferredFont(forTextStyle: self.textStyle)
        }
    }

    @objc fileprivate func preferredFontManagerDidChange(notification: Notification) {
        guard let object = notification.object as? [String: Any] else {
            return
        }
        
        let preferredFontManager = object[PreferredFontManagerObjectKey] as? PreferredFontManager
        let textStyle = object[PreferredFontManagerTextStyleKey] as? UIFontTextStyle
        if preferredFontManager == self.preferredFontManager && textStyle == self.textStyle {
            self.updateFont()
        }
    }

    @objc fileprivate func contentSizeCategoryDidChange(notification: Notification) {
        if let object = notification.object as? [String: Any] {
            if let sizeCategory = object[UIContentSizeCategoryNewValueKey] as? UIContentSizeCategory {
                self.lastSizeCategory = sizeCategory
            }
        }
        self.updateFont()
    }

}
