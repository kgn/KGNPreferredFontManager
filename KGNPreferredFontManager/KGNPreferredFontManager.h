//
//  KGNPreferredFontManager.h
//  KGNPreferredFontManager
//
//  Created by David Keegan on 7/4/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

@interface KGNPreferredFontManager : NSObject

- (void)registerFontNamed:(NSString *)fontName
         withBaseFontSize:(CGFloat)baseFontSize andIncrement:(CGFloat)increment
             forTextStyle:(NSString *)textStyle;

- (void)registerFontNamed:(NSString *)fontName
         withBaseFontSize:(CGFloat)baseFontSize andIncrement:(CGFloat)increment
             forTextStyle:(NSString *)textStyle includeAccessibilitySizes:(BOOL)accessibilitySizes;

- (void)registerFontNamed:(NSString *)fontName
             fromFontSize:(CGFloat)fromFontSize toFontSize:(CGFloat)toFontSize
             forTextStyle:(NSString *)textStyle;

- (void)registerFontNamed:(NSString *)fontName
             fromFontSize:(CGFloat)fromFontSize toFontSize:(CGFloat)toFontSize
             forTextStyle:(NSString *)textStyle includeAccessibilitySizes:(BOOL)accessibilitySizes;

- (UIFont *)preferredFontDescriptorWithTextStyle:(NSString *)textStyle;

@end
