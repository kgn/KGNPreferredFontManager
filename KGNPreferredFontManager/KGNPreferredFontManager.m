//
//  KGNPreferredFontManager.m
//  KGNPreferredFontManager
//
//  Created by David Keegan on 7/4/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

#import "KGNPreferredFontManager.h"

@interface KGNPreferredFontManager()
@property (strong, nonatomic) NSMutableDictionary *fonts;
@end

@implementation KGNPreferredFontManager

- (void)registerFontNamed:(NSString *)fontName withBaseFontSize:(CGFloat)baseFontSize andIncrement:(CGFloat)increment forTextStyle:(NSString *)textStyle{
    [self registerFontNamed:fontName withBaseFontSize:baseFontSize andIncrement:increment forTextStyle:textStyle includeAccessibilitySizes:NO];
}

- (void)registerFontNamed:(NSString *)fontName withBaseFontSize:(CGFloat)baseFontSize andIncrement:(CGFloat)increment forTextStyle:(NSString *)textStyle includeAccessibilitySizes:(BOOL)accessibilitySizes{
    NSArray *fontSizes = @[UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium,
                           UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge,
                           UIContentSizeCategoryExtraExtraExtraLarge];
    NSArray *accessibilityFontSizes = @[UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge,
                                        UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge,
                                        UIContentSizeCategoryAccessibilityExtraExtraExtraLarge];

    NSUInteger middleIndex = floor([fontSizes count]/2);
    NSMutableDictionary *fonts = [NSMutableDictionary dictionaryWithCapacity:[fontSizes count]+[accessibilityFontSizes count]];
    [fontSizes enumerateObjectsUsingBlock:^(NSString *textSize, NSUInteger idx, BOOL *stop){
        CGFloat fontSize = (idx-(CGFloat)middleIndex)*increment+baseFontSize;
        fonts[textSize] = [UIFont fontWithName:fontName size:fontSize];
    }];
    [accessibilityFontSizes enumerateObjectsUsingBlock:^(NSString *textSize, NSUInteger idx, BOOL *stop){
        NSUInteger offset = -1;
        if(accessibilitySizes){
            offset = idx;
        }
        CGFloat fontSize = (offset+[fontSizes count]-middleIndex)*increment+baseFontSize;
        fonts[textSize] = [UIFont fontWithName:fontName size:fontSize];
    }];

    if(!self.fonts){
        self.fonts = [NSMutableDictionary dictionary];
    }

    self.fonts[textStyle] = fonts;
}

- (void)registerFontNamed:(NSString *)fontName fromFontSize:(CGFloat)fromFontSize toFontSize:(CGFloat)toFontSize forTextStyle:(NSString *)textStyle{
    [self registerFontNamed:fontName fromFontSize:fromFontSize toFontSize:toFontSize forTextStyle:textStyle includeAccessibilitySizes:NO];
}

- (void)registerFontNamed:(NSString *)fontName fromFontSize:(CGFloat)fromFontSize toFontSize:(CGFloat)toFontSize forTextStyle:(NSString *)textStyle includeAccessibilitySizes:(BOOL)accessibilitySizes{
    NSArray *fontSizes = @[UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium,
                           UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge,
                           UIContentSizeCategoryExtraExtraExtraLarge];
    NSArray *accessibilityFontSizes = @[UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge,
                                        UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge,
                                        UIContentSizeCategoryAccessibilityExtraExtraExtraLarge];

    CGFloat fontSizeDelta = toFontSize-fromFontSize;
    NSUInteger numberOfFontSizes = accessibilitySizes ? [fontSizes count]+[accessibilityFontSizes count] : [fontSizes count];
    CGFloat fontSizeIncrement = fontSizeDelta/(CGFloat)numberOfFontSizes;

    NSMutableDictionary *fonts = [NSMutableDictionary dictionaryWithCapacity:[fontSizes count]+[accessibilityFontSizes count]];
    [fontSizes enumerateObjectsUsingBlock:^(NSString *textSize, NSUInteger idx, BOOL *stop){
        CGFloat fontSize = round(fromFontSize+fontSizeIncrement*idx);
        if(textSize == UIContentSizeCategoryExtraSmall){
            fontSize = fromFontSize;
        }
        if(!accessibilitySizes && textSize == UIContentSizeCategoryExtraExtraExtraLarge){
            fontSize = toFontSize;
        }
        fonts[textSize] = [UIFont fontWithName:fontName size:fontSize];
    }];

    [accessibilityFontSizes enumerateObjectsUsingBlock:^(NSString *textSize, NSUInteger idx, BOOL *stop){
        CGFloat fontSize = accessibilitySizes ? round(fromFontSize+fontSizeIncrement*idx) : toFontSize;
        if(textSize == UIContentSizeCategoryAccessibilityExtraExtraExtraLarge){
            fontSize = toFontSize;
        }
        fonts[textSize] = [UIFont fontWithName:fontName size:fontSize];
    }];

    if(!self.fonts){
        self.fonts = [NSMutableDictionary dictionary];
    }

    self.fonts[textStyle] = fonts;
}

- (UIFont *)preferredFontDescriptorWithTextStyle:(NSString *)textStyle{
    NSString *contentSize = [[UIApplication sharedApplication] preferredContentSizeCategory];
    return self.fonts[textStyle][contentSize];
}

@end
