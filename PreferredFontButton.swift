//
//  PreferredFontButton.swift
//  Vesting
//
//  Created by David Keegan on 1/11/15.
//  Copyright (c) 2015 David Keegan. All rights reserved.
//

import UIKit

class PreferredFontButton: UIButton {

    var textStyle: String? = UIFontTextStyleBody {
        didSet {
            self.updateFont()
        }
    }
    var preferredFontManager: PreferredFontManager? {
        didSet {
            self.updateFont()
        }
    }

    class func systemButton(textStyle: String? = nil) -> PreferredFontButton {
        let button = self.buttonWithType(.System) as! PreferredFontButton
        button.textStyle = textStyle
        return button
    }

    init(textStyle: String) {
        super.init()
        self.textStyle = textStyle
        self.setup()
    }

    override init() {
        super.init()
        self.setup()
    }

    override init(frame: CGRect) {
        super.init(frame:frame)
        self.setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.setup()
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // Use this to override the setup of the label
    func setup() {
        self.updateFont()
        NSNotificationCenter.defaultCenter().addObserver(
            self, selector: "contentSizeCategoryDidChangeNotification:",
            name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

    private func updateFont() {
        if let preferredFontManager = self.preferredFontManager {
            if let textStyle = self.textStyle, font = preferredFontManager.preferredFontForTextStyle(textStyle) {
                self.titleLabel?.font = font
            } else if let font = preferredFontManager.preferredFontForTextStyle(UIFontTextStyleBody) {
                self.titleLabel?.font = font
            }
        } else if let textStyle = self.textStyle {
            self.titleLabel?.font = UIFont.preferredFontForTextStyle(textStyle)
        } else {
            self.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        }
    }

    @objc private func contentSizeCategoryDidChangeNotification(notification: NSNotification) {
        self.updateFont()
    }

}
