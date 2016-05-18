//
//  ViewController.m
//  AlertTip
//
//  Created by jzl on 16/5/18.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import "ViewController.h"
#import "TipView.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<TipViewDelegate>
@property(nonatomic,strong)WKWebView*  webView;
@end

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
//    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.webView];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
//    self.webView.allowsBackForwardNavigationGestures = YES;
 }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    TipView * tips = [[TipView alloc] initWithBackgroundImage:[UIImage imageNamed:@"tipBg.jpg"] andTitle:@"提示" andMsg:@"分享 iOS 开发的知识，解决大家遇到的问题，讨论iOS开发的前沿"];
    tips.Delegate = self;
    [tips setButtonWithName:@"取消" backgroundImage:[UIImage imageNamed:@"cancel.png"] andSure:@"确定" backgroundImage:[UIImage imageNamed:@"sure.png"]];
    [tips show];
}
-(void)alertTips:(id)alertView buttonClickedAtIndex:(int)buttonIndex{
    if (buttonIndex==0) {
        NSLog(@"取消");
    }
    if (buttonIndex==1) {
        NSLog(@"确定");
    }
}
@end
