//
//  FDSecondViewController.m
//  FDLocalizedDemo
//
//  Created by 徐忠林 on 14/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDSecondViewController.h"

@interface FDSecondViewController ()

@end

@implementation FDSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    
    #warning 设置text的时候按照这样的形式
    //因此我们暂且这样使用（这样直接使用，会跟随系统语言）
    label.text = NSLocalizedStringFromTable(@"英语", @"ASLocalized", nil);;
    
    [self.view addSubview:label];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
        // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
