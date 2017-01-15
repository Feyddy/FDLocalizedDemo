//
//  FDLanguageUtil.m
//  Charterprime
//
//  Created by 徐忠林 on 15/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDLanguageUtil.h"


static NSString * const FDLanguageUtilDefaultLanguage   = @"zh-Hans";

static NSString * const FDLanguageUtilSupportLanguages  = @"zh-Hans,en, zh-Hant";


@implementation FDLanguageUtil

#pragma mark - Singleton

+ (FDLanguageUtil*)sharedInstance {
    static FDLanguageUtil *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[FDLanguageUtil alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Public

- (void)setLanguage:(NSString *)language {
    if ([self doSupportTheNewLanguage:language]) {
        self.currentLanguage = language;
        [[NSUserDefaults standardUserDefaults] setObject:language forKey:FDLanguageUtilLanguageIdentifier];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

#pragma mark - For Macros

- (NSString *)localizedStringForKey:(NSString *)key {
    return  [[self manualLanguageBundle:[NSBundle mainBundle]] localizedStringForKey:(key) value:@"" table:nil];
}

- (NSString *)localizedStringForKey:(NSString *)key fromTable:(NSString *)table {
    return  [[self manualLanguageBundle:[NSBundle mainBundle]] localizedStringForKey:(key) value:@"" table:table];
}

- (NSBundle *)manualLanguageBundle:(NSBundle *)bundle {
    NSBundle *newBundle = bundle;
    
    NSString *currentLanguageString = [[NSUserDefaults standardUserDefaults] objectForKey:FDLanguageUtilLanguageIdentifier];
    
    // path to this languages bundle
    NSString *path = [bundle pathForResource:currentLanguageString ofType:@"lproj" ];
    
    if (path) {
        newBundle = [NSBundle bundleWithPath:path];
    }
    
    return newBundle;
}

#pragma mark - Init

- (id)init {
    self = [super init];
    if (self) {
        NSString *currentLanguageString =
        [[NSUserDefaults standardUserDefaults] objectForKey:FDLanguageUtilLanguageIdentifier];
        if (currentLanguageString.length > 0) {
            self.currentLanguage = currentLanguageString;
        }
        else {
            // first init
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
            NSString *currentLanguage = languages[0];
            
            // use english default
            NSString *newLanguage =
            [FDLanguageUtilDefaultLanguage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([self doSupportTheNewLanguage:currentLanguage]) {
                newLanguage = currentLanguage;
            }
            
            [self setLanguage:newLanguage];
        }
    }
    return self;
}

#pragma mark - Private

- (BOOL)doSupportTheNewLanguage:(NSString *)newLanguage {
    NSArray *supportLanguagesArray = [FDLanguageUtilSupportLanguages componentsSeparatedByString:@","];
    for (NSString *language in supportLanguagesArray) {
        NSString *cleanLanguage = [language stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([newLanguage isEqualToString:cleanLanguage]) {
            return YES;
        }
    }
    return NO;
}

@end
