//
//  UIFont+custom.m
//  
//
//  Created by icash on 16-3-2.
//  Copyright (c) 2016年 iCash. All rights reserved.
//

#import "UIFont+custom.h"

@implementation UIFont (custom)

+ (UIFont *)customFontWithSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@"PingFangTC-Light" size:fontSize];
    if (font == nil) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    // Avenir
    return font;
}
+ (UIFont *)customBoldFontWithSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@"PingFangTC-Light" size:fontSize];
    if (font == nil) {
        font = [UIFont boldSystemFontOfSize:fontSize];
    }
    // Avenir
    return font;
}

@end

/*
 "Thonburi-Bold",
 Thonburi,
 "Thonburi-Light",
 "SnellRoundhand-Black",
 "SnellRoundhand-Bold",
 SnellRoundhand,
 AcademyEngravedLetPlain,
 "MarkerFelt-Thin",
 "MarkerFelt-Wide",
 "Avenir-Heavy",
 "Avenir-Oblique",
 "Avenir-Black",
 "Avenir-Book",
 "Avenir-BlackOblique",
 "Avenir-HeavyOblique",
 "Avenir-Light",
 "Avenir-MediumOblique",
 "Avenir-Medium",
 "Avenir-LightOblique",
 "Avenir-Roman",
 "Avenir-BookOblique",
 "GeezaPro-Bold",
 GeezaPro,
 "GeezaPro-Light",
 ArialRoundedMTBold,
 "Trebuchet-BoldItalic",
 TrebuchetMS,
 "TrebuchetMS-Bold",
 "TrebuchetMS-Italic",
 ArialMT,
 "Arial-BoldItalicMT",
 "Arial-ItalicMT",
 "Arial-BoldMT",
 "Marion-Regular",
 "Marion-Italic",
 "Marion-Bold",
 "Menlo-BoldItalic",
 "Menlo-Regular",
 "Menlo-Bold",
 "Menlo-Italic",
 MalayalamSangamMN,
 "MalayalamSangamMN-Bold",
 KannadaSangamMN,
 "KannadaSangamMN-Bold",
 "GurmukhiMN-Bold",
 GurmukhiMN,
 "BodoniSvtyTwoOSITCTT-BookIt",
 "BodoniSvtyTwoOSITCTT-Bold",
 "BodoniSvtyTwoOSITCTT-Book",
 "BradleyHandITCTT-Bold",
 "Cochin-Bold",
 "Cochin-BoldItalic",
 "Cochin-Italic",
 Cochin,
 SinhalaSangamMN,
 "SinhalaSangamMN-Bold",
 "HiraKakuProN-W6",
 "HiraKakuProN-W3",
 "IowanOldStyle-Bold",
 "IowanOldStyle-BoldItalic",
 "IowanOldStyle-Italic",
 "IowanOldStyle-Roman",
 DamascusBold,
 Damascus,
 DamascusMedium,
 DamascusSemiBold,
 "AlNile-Bold",
 AlNile,
 Farah,
 "Papyrus-Condensed",
 Papyrus,
 "Verdana-BoldItalic",
 "Verdana-Italic",
 Verdana,
 "Verdana-Bold",
 ZapfDingbatsITC,
 "DINCondensed-Bold",
 "AvenirNextCondensed-Regular",
 "AvenirNextCondensed-MediumItalic",
 "AvenirNextCondensed-UltraLightItalic",
 "AvenirNextCondensed-UltraLight",
 "AvenirNextCondensed-BoldItalic",
 "AvenirNextCondensed-Italic",
 "AvenirNextCondensed-Medium",
 "AvenirNextCondensed-HeavyItalic",
 "AvenirNextCondensed-Heavy",
 "AvenirNextCondensed-DemiBoldItalic",
 "AvenirNextCondensed-DemiBold",
 "AvenirNextCondensed-Bold",
 Courier,
 "Courier-Oblique",
 "Courier-BoldOblique",
 "Courier-Bold",
 "HoeflerText-Regular",
 "HoeflerText-BlackItalic",
 "HoeflerText-Italic",
 "HoeflerText-Black",
 EuphemiaUCAS,
 "EuphemiaUCAS-Bold",
 "EuphemiaUCAS-Italic",
 "Helvetica-Oblique",
 "Helvetica-Light",
 "Helvetica-Bold",
 Helvetica,
 "Helvetica-BoldOblique",
 "Helvetica-LightOblique",
 "HiraMinProN-W6",
 "HiraMinProN-W3",
 BodoniOrnamentsITCTT,
 "Superclarendon-Regular",
 "Superclarendon-BoldItalic",
 "Superclarendon-Light",
 "Superclarendon-BlackItalic",
 "Superclarendon-Italic",
 "Superclarendon-LightItalic",
 "Superclarendon-Bold",
 "Superclarendon-Black",
 DiwanMishafi,
 "Optima-Regular",
 "Optima-Italic",
 "Optima-Bold",
 "Optima-BoldItalic",
 "Optima-ExtraBlack",
 "GujaratiSangamMN-Bold",
 GujaratiSangamMN,
 DevanagariSangamMN,
 "DevanagariSangamMN-Bold",
 AppleColorEmoji,
 SavoyeLetPlain,
 Kailasa,
 "Kailasa-Bold",
 "TimesNewRomanPS-BoldItalicMT",
 TimesNewRomanPSMT,
 "TimesNewRomanPS-BoldMT",
 "TimesNewRomanPS-ItalicMT",
 TeluguSangamMN,
 "TeluguSangamMN-Bold",
 "STHeitiSC-Medium",
 "STHeitiSC-Light",
 "AppleSDGothicNeo-Thin",
 "AppleSDGothicNeo-SemiBold",
 "AppleSDGothicNeo-Medium",
 "AppleSDGothicNeo-Regular",
 "AppleSDGothicNeo-Bold",
 "AppleSDGothicNeo-Light",
 "Futura-Medium",
 "Futura-CondensedMedium",
 "Futura-MediumItalic",
 "Futura-CondensedExtraBold",
 "BodoniSvtyTwoITCTT-Book",
 "BodoniSvtyTwoITCTT-Bold",
 "BodoniSvtyTwoITCTT-BookIta",
 "Baskerville-Bold",
 "Baskerville-SemiBoldItalic",
 "Baskerville-BoldItalic",
 Baskerville,
 "Baskerville-SemiBold",
 "Baskerville-Italic",
 Symbol,
 "STHeitiTC-Medium",
 "STHeitiTC-Light",
 Copperplate,
 "Copperplate-Light",
 "Copperplate-Bold",
 PartyLetPlain,
 "AmericanTypewriter-Light",
 "AmericanTypewriter-CondensedLight",
 "AmericanTypewriter-CondensedBold",
 AmericanTypewriter,
 "AmericanTypewriter-Condensed",
 "AmericanTypewriter-Bold",
 "ChalkboardSE-Light",
 "ChalkboardSE-Regular",
 "ChalkboardSE-Bold",
 "AvenirNext-MediumItalic",
 "AvenirNext-Bold",
 "AvenirNext-UltraLight",
 "AvenirNext-DemiBold",
 "AvenirNext-HeavyItalic",
 "AvenirNext-Heavy",
 "AvenirNext-Medium",
 "AvenirNext-Italic",
 "AvenirNext-UltraLightItalic",
 "AvenirNext-BoldItalic",
 "AvenirNext-Regular",
 "AvenirNext-DemiBoldItalic",
 BanglaSangamMN,
 "BanglaSangamMN-Bold",
 "Noteworthy-Bold",
 "Noteworthy-Light",
 Zapfino,
 TamilSangamMN,
 "TamilSangamMN-Bold",
 Chalkduster,
 "ArialHebrew-Bold",
 "ArialHebrew-Light",
 ArialHebrew,
 "Georgia-BoldItalic",
 "Georgia-Bold",
 "Georgia-Italic",
 Georgia,
 "HelveticaNeue-BoldItalic",
 "HelveticaNeue-Light",
 "HelveticaNeue-Italic",
 "HelveticaNeue-UltraLightItalic",
 "HelveticaNeue-CondensedBold",
 "HelveticaNeue-MediumItalic",
 "HelveticaNeue-Thin",
 "HelveticaNeue-Medium",
 "HelveticaNeue-ThinItalic",
 "HelveticaNeue-UltraLight",
 "HelveticaNeue-LightItalic",
 "HelveticaNeue-Bold",
 HelveticaNeue,
 "HelveticaNeue-CondensedBlack",
 GillSans,
 "GillSans-Italic",
 "GillSans-BoldItalic",
 "GillSans-Light",
 "GillSans-LightItalic",
 "GillSans-Bold",
 "Palatino-Roman",
 "Palatino-Italic",
 "Palatino-Bold",
 "Palatino-BoldItalic",
 CourierNewPSMT,
 "CourierNewPS-BoldMT",
 "CourierNewPS-ItalicMT",
 "CourierNewPS-BoldItalicMT",
 OriyaSangamMN,
 "OriyaSangamMN-Bold",
 "Didot-Bold",
 "Didot-Italic",
 Didot,
 "DINAlternate-Bold",
 "BodoniSvtyTwoSCITCTT-Book"
 */
