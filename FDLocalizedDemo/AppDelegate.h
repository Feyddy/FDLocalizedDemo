//
//  AppDelegate.h
//  FDLocalizedDemo
//
//  Created by 徐忠林 on 14/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
#warning 通过单利来设置不同的语言转换
- (void)reDrawAllUIForLanguage:(NSString *)language;

@property (strong, nonatomic) UIWindow *window;


@end

