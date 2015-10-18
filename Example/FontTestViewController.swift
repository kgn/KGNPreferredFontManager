//
//  FontTestViewController.swift
//  Tilt
//
//  Created by David Keegan on 8/16/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit
import KGNAutoLayout
import KGNPreferredFontManager

private let FontTestPreferredFontManager: PreferredFontManager = {
    let preferredFontManager = PreferredFontManager()
    preferredFontManager.registerFontsForTextStyle(UIFontTextStyleHeadline, fontName: nil, fontWeight: UIFontWeightUltraLight, baseFontSize: UIFont.systemFontSize()*4, increment: 1, decrement: 1)
    preferredFontManager.registerFontsForTextStyle(UIFontTextStyleSubheadline, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize()*2, increment: 1, decrement: 1)
    preferredFontManager.registerFontsForTextStyle(UIFontTextStyleBody, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.labelFontSize(), increment: 2, decrement: 1, includeAccessibilitySizes: true)
    preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption1, fontName: nil, fontWeight: UIFontWeightMedium, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
    preferredFontManager.registerFontsForTextStyle(UIFontTextStyleCaption2, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
    preferredFontManager.registerFontsForTextStyle(UIFontTextStyleFootnote, fontName: nil, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.smallSystemFontSize(), increment: 1, decrement: 1)
    return preferredFontManager
}()

class Label: PreferredFontLabel {
    override func setup() {
        self.preferredFontManager = FontTestPreferredFontManager
        super.setup()
    }
}

class FontTestViewController: UIViewController {

    private var labels: [Label] = []
    private let fontSizes = [UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium,
        UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge,
        UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium,
        UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge,
        UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]

    override func viewDidLoad() {
        super.viewDidLoad()

        let largePadding: CGFloat = 20

        self.view.backgroundColor = UIColor.whiteColor()

        let headline = Label(textStyle: UIFontTextStyleHeadline)
        headline.text = "Headline"
        self.view.addSubview(headline)
        headline.centerHorizontallyInSuperview()

        let subheadline = Label(textStyle: UIFontTextStyleSubheadline)
        subheadline.text = "Subheadline"
        self.view.addSubview(subheadline)
        subheadline.centerHorizontallyInSuperview()

        let body = Label(textStyle: UIFontTextStyleBody)
        body.text = "Body"
        self.view.addSubview(body)
        body.centerHorizontallyInSuperview()

        let caption1 = Label(textStyle: UIFontTextStyleCaption1)
        caption1.text = "Caption1"
        self.view.addSubview(caption1)
        caption1.centerHorizontallyInSuperview()

        let caption2 = Label(textStyle: UIFontTextStyleCaption2)
        caption2.text = "Caption2"
        self.view.addSubview(caption2)
        caption2.centerHorizontallyInSuperview()

        let footnote = Label(textStyle: UIFontTextStyleFootnote)
        footnote.text = "Footnote"
        self.view.addSubview(footnote)
        footnote.centerHorizontallyInSuperview()

        self.labels = [headline, subheadline, body, caption1, caption2, footnote]
        self.view.centerViewsVertically(labels, separation: largePadding)

        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = Float(fontSizes.count-1)
        if let currentIndex = self.fontSizes.indexOf(UIApplication.sharedApplication().preferredContentSizeCategory) {
            slider.value = Float(currentIndex)
        }
        slider.addTarget(self, action: "sliderAction:", forControlEvents: .ValueChanged)
        self.view.addSubview(slider)
        slider.pinToBottomEdgeOfSuperview(largePadding)
        slider.pinToSideEdgesOfSuperview(largePadding)
    }

    @objc private func sliderAction(sender: UISlider) {
        let index = Int(round(sender.value))
        for label in self.labels {
            if let font = label.preferredFontManager?.preferredFontForTextStyle(label.textStyle, sizeCategory: self.fontSizes[index]) {
                label.font = font
            }
        }
    }

}
