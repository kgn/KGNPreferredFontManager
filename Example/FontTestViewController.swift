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
    private let fontSizes: [UIContentSizeCategory] = [.extraSmall, .small, .medium,
        .large, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge,
        .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge,
        .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge]

    override func viewDidLoad() {
        super.viewDidLoad()

        let largePadding: CGFloat = 20

        self.view.backgroundColor = UIColor.white

        // Register the fonts with the shared manager
        PreferredFontManager.shared.registerFonts(forTextStyle: .headline, fontWeight: .ultraLight, baseFontSize: UIFont.systemFontSize*4, increment: 1, decrement: 1)
        PreferredFontManager.shared.registerFonts(forTextStyle: .subheadline, fontWeight: .regular, baseFontSize: UIFont.systemFontSize*2, increment: 1, decrement: 1)
        PreferredFontManager.shared.registerFonts(forTextStyle: .body, fontWeight: .regular, baseFontSize: UIFont.labelFontSize, increment: 2, decrement: 1, includeAccessibilitySizes: true)
        PreferredFontManager.shared.registerFonts(forTextStyle: .caption1, fontWeight: .medium, baseFontSize: UIFont.systemFontSize, increment: 1, decrement: 1)
        PreferredFontManager.shared.registerFonts(forTextStyle: .caption2, fontWeight: .regular, baseFontSize: UIFont.systemFontSize, increment: 1, decrement: 1)
        PreferredFontManager.shared.registerFonts(forTextStyle: .footnote, fontWeight: .regular, baseFontSize: UIFont.smallSystemFontSize, increment: 1, decrement: 1)

        let headline = PreferredFontLabel(textStyle: .headline)
        headline.text = "Headline"
        self.view.addSubview(headline)
        headline.centerHorizontallyInSuperview()

        let subheadline = PreferredFontLabel(textStyle: .subheadline)
        subheadline.text = "Subheadline"
        self.view.addSubview(subheadline)
        subheadline.centerHorizontallyInSuperview()

        let body = PreferredFontLabel(textStyle: .body)
        body.text = "Body"
        self.view.addSubview(body)
        body.centerHorizontallyInSuperview()

        let caption1 = PreferredFontLabel(textStyle: .caption1)
        caption1.text = "Caption1"
        self.view.addSubview(caption1)
        caption1.centerHorizontallyInSuperview()

        let caption2 = PreferredFontLabel(textStyle: .caption2)
        caption2.text = "Caption2"
        self.view.addSubview(caption2)
        caption2.centerHorizontallyInSuperview()

        let footnote = PreferredFontLabel(textStyle: .footnote)
        footnote.text = "Footnote"
        self.view.addSubview(footnote)
        footnote.centerHorizontallyInSuperview()

        self.labels = [headline, subheadline, body, caption1, caption2, footnote]
        self.labels.centerVertically(to: self.view, withSeparation: largePadding)

        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = Float(fontSizes.count-1)
        if let currentIndex = self.fontSizes.firstIndex(of: UIApplication.shared.preferredContentSizeCategory) {
            slider.value = Float(currentIndex)
        }
        slider.addTarget(self, action: .sliderAction, for: .valueChanged)
        self.view.addSubview(slider)
        slider.pinToBottomEdgeOfSuperview(withOffset: largePadding)
        slider.pinToSideEdgesOfSuperview(withOffset: largePadding)
    }

    @objc fileprivate func sliderAction(sender: UISlider) {
        let index = Int(round(sender.value))
        for label in self.labels {
            if let font = label.preferredFontManager?.preferredFont(forTextStyle: label.textStyle, sizeCategory: self.fontSizes[index]) {
                label.font = font
            }
        }
    }

}
