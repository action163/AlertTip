//
//  ViewController.m
//  AlertTip
//
//  Created by jzl on 16/5/18.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import "ViewController.h"
#import "TipView.h"

@interface ViewController ()<TipViewDelegate>
@end

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
 }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    TipView * tips = [[TipView alloc] initWithBackgroundImage:[UIImage imageNamed:@"tipBg.jpg"] andTitle:@"提示" andMsg:@"这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息"];
    tips.Delegate = self;
    [tips setButtonWithName:@"取消" backgroundImage:[UIImage imageNamed:@"cancel.png"] andSure:@"确定" backgroundImage:[UIImage imageNamed:@"sure.png"]];
    [tips show];
}
-(void)alertView:(id)alertView buttonClickedAtIndex:(int)buttonIndex{
    if (buttonIndex==0) {
        NSLog(@"取消");
    }
    if (buttonIndex==1) {
        NSLog(@"确定");
    }
}
@end
