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

private extension Selector {
    static let sliderAction = #selector(FontTestViewController.sliderAction(sender:))
}

class FontTestViewController: UIViewController {

    private var labels: [PreferredFontLabel] = []
    private let fontSizes = [ContentSizeCategory.extraSmall, ContentSizeCategory.small, ContentSizeCategory.medium,
        ContentSizeCategory.large, ContentSizeCategory.extraLarge, ContentSizeCategory.extraExtraLarge,
        ContentSizeCategory.extraExtraExtraLarge, ContentSizeCategory.accessibilityMedium,
        ContentSizeCategory.accessibilityLarge, ContentSizeCategory.accessibilityExtraLarge,
        ContentSizeCategory.accessibilityExtraExtraLarge, ContentSizeCategory.accessibilityExtraExtraExtraLarge]

    override func viewDidLoad() {
        super.viewDidLoad()

        let largePadding: CGFloat = 20

        self.view.backgroundColor = UIColor.white()

        // Register the fonts with the shared manager
        PreferredFontManager.sharedManager().registerFonts(forTextStyle: UIFontTextStyleHeadline, fontWeight: UIFontWeightUltraLight, baseFontSize: UIFont.systemFontSize()*4, increment: 1, decrement: 1)
        PreferredFontManager.sharedManager().registerFonts(forTextStyle: UIFontTextStyleSubheadline, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize()*2, increment: 1, decrement: 1)
        PreferredFontManager.sharedManager().registerFonts(forTextStyle: UIFontTextStyleBody, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.labelSize(), increment: 2, decrement: 1, includeAccessibilitySizes: true)
        PreferredFontManager.sharedManager().registerFonts(forTextStyle: UIFontTextStyleCaption1, fontWeight: UIFontWeightMedium, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
        PreferredFontManager.sharedManager().registerFonts(forTextStyle: UIFontTextStyleCaption2, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.systemFontSize(), increment: 1, decrement: 1)
        PreferredFontManager.sharedManager().registerFonts(forTextStyle: UIFontTextStyleFootnote, fontWeight: UIFontWeightRegular, baseFontSize: UIFont.smallSystemFontSize(), increment: 1, decrement: 1)

        let headline = PreferredFontLabel(textStyle: UIFontTextStyleHeadline)
        headline.text = "Headline"
        self.view.addSubview(headline)
        headline.centerHorizontallyInSuperview()

        let subheadline = PreferredFontLabel(textStyle: UIFontTextStyleSubheadline)
        subheadline.text = "Subheadline"
        self.view.addSubview(subheadline)
        subheadline.centerHorizontallyInSuperview()

        let body = PreferredFontLabel(textStyle: UIFontTextStyleBody)
        body.text = "Body"
        self.view.addSubview(body)
        body.centerHorizontallyInSuperview()

        let caption1 = PreferredFontLabel(textStyle: UIFontTextStyleCaption1)
        caption1.text = "Caption1"
        self.view.addSubview(caption1)
        caption1.centerHorizontallyInSuperview()

        let caption2 = PreferredFontLabel(textStyle: UIFontTextStyleCaption2)
        caption2.text = "Caption2"
        self.view.addSubview(caption2)
        caption2.centerHorizontallyInSuperview()

        let footnote = PreferredFontLabel(textStyle: UIFontTextStyleFootnote)
        footnote.text = "Footnote"
        self.view.addSubview(footnote)
        footnote.centerHorizontallyInSuperview()

        self.labels = [headline, subheadline, body, caption1, caption2, footnote]
        self.view.centerVertically(views: labels, separation: largePadding)

        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = Float(fontSizes.count-1)
        if let currentIndex = self.fontSizes.index(of: ContentSizeCategory.preferredContentSizeCategory) {
            slider.value = Float(currentIndex)
        }
        slider.addTarget(self, action: .sliderAction, for: .valueChanged)
        self.view.addSubview(slider)
        slider.pinToBottomEdgeOfSuperview(offset: largePadding)
        slider.pinToSideEdgesOfSuperview(offset: largePadding)
    }

    @objc private func sliderAction(sender: UISlider) {
        let index = Int(round(sender.value))
        for label in self.labels {
            if let font = label.preferredFontManager?.preferredFont(forTextStyle: label.textStyle, sizeCategory: self.fontSizes[index]) {
                label.font = font
            }
        }
    }

}
