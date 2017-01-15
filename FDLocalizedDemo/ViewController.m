//
//  ViewController.m
//  FDLocalizedDemo
//
//  Created by 徐忠林 on 14/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "ViewController.h"
#import "FDSecondViewController.h"
#warning 通过单利来设置不同的语言转换
#import "AppDelegate.h"
@interface ViewController ()
{
    UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor=[UIColor whiteColor];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    
    #warning 设置text的时候按照这样的形式
    //因此我们暂且这样使用（这样直接使用，会跟随系统语言）
    label.text = NSLocalizedStringFromTable(@"英语", @"ASLocalized", nil);
    
    //对于这样使用NSLocalizedString("英语", nil)，切记多语言文件名必须是Localizable, 这里我们就不可以使用这种了；
    
    [self.view addSubview:label];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIButton* enBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 30)];
    enBtn.backgroundColor=[UIColor orangeColor];
    NSString *str =NSLocalizedStringFromTable(@"英语", @"ASLocalized", nil);
    [enBtn setTitle:str forState:UIControlStateNormal];
    [enBtn addTarget:self action:@selector(enBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enBtn];
    
    
    
}

- (void)pushAction {
    [self.navigationController pushViewController:[[FDSecondViewController alloc] init] animated:YES];
}


#warning 设置text的时候按照这样的形式
- (void)enBtnAction:(UIButton *)btn {
    // 让appDelegate设置语言
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate reDrawAllUIForLanguage:@"zh-Hant"];//繁体字
    
    // 发送通知，让其他页面改变语言
    [[NSNotificationCenter defaultCenter] postNotificationName:FDLanguageUtilLanguageIdentifier object:nil];
    label.text = NSLocalizedStringFromTable(@"英语", @"ASLocalized", nil);
    [btn setTitle:NSLocalizedStringFromTable(@"英语", @"ASLocalized", nil) forState:UIControlStateNormal];
    
    [self.view reloadInputViews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
