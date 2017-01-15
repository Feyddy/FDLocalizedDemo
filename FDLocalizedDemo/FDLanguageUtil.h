//
//  FDLanguageUtil.h
//  Charterprime
//
//  Created by 徐忠林 on 15/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <Foundation/Foundation.h>

#undef NSLocalizedString
#define NSLocalizedString(key, comment) \
[[FDLanguageUtil sharedInstance] localizedStringForKey:(key)]

#undef NSLocalizedStringFromTable
#define NSLocalizedStringFromTable(key, tbl, comment) \
[[FDLanguageUtil sharedInstance] localizedStringForKey:(key) fromTable:(tbl)]

#undef NSLocalizedStringFromTableInBundle
#define NSLocalizedStringFromTableInBundle(key, tbl, bundle, comment) \
[[[FDLanguageUtil sharedInstance] manualLanguageBundle:(bundle)] localizedStringForKey:(key) value:@"" table:(tbl)]

#undef NSLocalizedStringWithDefaultValue
#define NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) \
[[[FDLanguageUtil sharedInstance] manualLanguageBundle:(bundle)] localizedStringForKey:(key) value:(val) table:(tbl)]

static NSString * const FDLanguageUtilLanguageIdentifier = @"FDLanguageUtilLanguageIdentifier";


@interface FDLanguageUtil : NSObject

@property (nonatomic, retain) NSString *currentLanguage;

+ (FDLanguageUtil*)sharedInstance;

- (void)setLanguage:(NSString *)language;


#pragma mark - For Macros

- (NSString *)localizedStringForKey:(NSString *)key;
- (NSString *)localizedStringForKey:(NSString *)key fromTable:(NSString *)table;
- (NSBundle *)manualLanguageBundle:(NSBundle *)bundle;



@end
