//
//  PreferredFontButton.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

// TODO: figure out how to work with 
// convenience init(type buttonType: UIButtonType)
// Right now the font it set in init, then overwritten
// when the button type is set

import UIKit

public class PreferredFontButton: UIButton {

    public var textStyle: String = UIFontTextStyleBody {
        didSet {
            self.updateFont()
        }
    }

    public var preferredFontManager: PreferredFontManager? {
        didSet {
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

    public convenience init(textStyle: String) {
        self.init(frame: CGRectZero)
        self.textStyle = textStyle
        self.updateFont()
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    public func setup() {
        self.updateFont()
        NSNotificationCenter.defaultCenter().addObserver(
            self, selector: "contentSizeCategoryDidChangeNotification:",
            name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

    private func updateFont() {
        if let font = self.preferredFontManager?.preferredFontForTextStyle(self.textStyle) {
            self.titleLabel?.font = font
        } else  {
            self.titleLabel?.font = UIFont.preferredFontForTextStyle(self.textStyle)
        }
    }

    @objc private func contentSizeCategoryDidChangeNotification(notification: NSNotification) {
        self.updateFont()
    }

}
