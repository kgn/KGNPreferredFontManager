//
//  PreferredFontButton.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

/// Subclass of `UIButton` whos font is controlled by
/// the `textStyle` and `preferredFontManager` properties.
/// The font used is automaticly updated when the user changes
/// their accesability text size setting.
public class PreferredFontButton: UIButton {

    /// The text style to be used.
    /// Defaults to `UIFontTextStyleBody`.
    public var textStyle: String = UIFontTextStyleBody {
        didSet {
            self.updateFont()
        }
    }

    /// The preferred font manager object to use.
    /// Defaults to `PreferredFontManager.sharedManager()`.
    public var preferredFontManager: PreferredFontManager? = PreferredFontManager.sharedManager() {
        didSet {
            self.updateFont()
        }
    }

    private var hasMovedToSuperview = false
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()

        // HACK: The buttonType convenience init
        // cannot be overwritten, so this is a hack
        // to update the font when the button is
        // first moved to a superview
        if !self.hasMovedToSuperview && self.buttonType == .System {
            self.hasMovedToSuperview = true
            self.updateFont()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }


    /// Initialize a `PreferredFontButton` object with a given textStyle.
    public convenience init(textStyle: String) {
        self.init(frame: CGRect.zero)
        self.textStyle = textStyle
        self.updateFont()
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    /// This `setup` method is called when initalized.
    /// Override this method to customize the setup of the button object.
    /// Be sure to call `super.setup()` in your implementation.
    public func setup() {
        self.updateFont()
        NSNotificationCenter.defaultCenter().addObserver(
            self, selector: #selector(PreferredFontButton.contentSizeCategoryDidChangeNotification(_:)),
            name: UIContentSizeCategoryDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(
            self, selector: #selector(PreferredFontButton.preferredFontManagerDidChangeNotification(_:)),
            name: PreferredFontManagerDidChangeNotification, object: nil)
    }

    private func updateFont() {
        if let font = self.preferredFontManager?.preferredFontForTextStyle(self.textStyle) {
            self.titleLabel?.font = font
        } else  {
            self.titleLabel?.font = UIFont.preferredFontForTextStyle(self.textStyle)
        }
    }

    @objc private func preferredFontManagerDidChangeNotification(notification: NSNotification) {
        let preferredFontManager = notification.object?[PreferredFontManagerObjectKey] as? PreferredFontManager
        let textStyle = notification.object?[PreferredFontManagerTextStyleKey] as? String
        if preferredFontManager == self.preferredFontManager && textStyle == self.textStyle {
            self.updateFont()
        }
    }

    @objc private func contentSizeCategoryDidChangeNotification(notification: NSNotification) {
        self.updateFont()
    }

}
