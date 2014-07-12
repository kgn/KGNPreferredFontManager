# Example

``` obj-c
+ (UIFont *)preferredFontDescriptorWithTextStyle:(NSString *)textStyle{
    static KGNPreferredFontManager *preferredFontManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        preferredFontManager = [KGNPreferredFontManager new];
        [preferredFontManager registerFontNamed:@"Lato-BlackItalic" withBaseFontSize:36 andIncrement:2 forTextStyle:UIFontTextStyleHeadline];
        [preferredFontManager registerFontNamed:@"Lato-BlackItalic" withBaseFontSize:22 andIncrement:2 forTextStyle:UIFontTextStyleSubheadline];
        [preferredFontManager registerFontNamed:@"Lato-Regular" withBaseFontSize:19 andIncrement:2 forTextStyle:UIFontTextStyleBody includeAccessibilitySizes:YES];
        [preferredFontManager registerFontNamed:@"Lato-BoldItalic" withBaseFontSize:15 andIncrement:2 forTextStyle:UIFontTextStyleCaption1];
        [preferredFontManager registerFontNamed:@"Lato-Italic" withBaseFontSize:13 andIncrement:2 forTextStyle:UIFontTextStyleCaption2];
        [preferredFontManager registerFontNamed:@"Lato-Regular" withBaseFontSize:11 andIncrement:2 forTextStyle:UIFontTextStyleFootnote];
    });
    return [preferredFontManager preferredFontDescriptorWithTextStyle:textStyle];
}
```
