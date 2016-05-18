//
//  TipView.m
//  AlertTip
//
//  Created by jzl on 16/5/18.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import "TipView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define TOPMAGIN 20.0
#define LEFTMAGIN 5.0
#define FIXMAGIN 5.0
#define LEFTBTN  20.0
@implementation TipView

-(id)initWithBackgroundImage:(UIImage *)backgroundImage andTitle:(NSString *)tips andMsg:(NSString *)msg{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        self.backgroundColor = [UIColor clearColor];
        self.title = tips;
        self.msg = msg;
        self.tag = 19911008;
        self.tipBgImage= backgroundImage;
        self.boxView = [[UIView alloc] init];
        if (self.tipBgImage!=nil) {
            self.boxView.backgroundColor = [UIColor colorWithPatternImage:self.tipBgImage];
        }else{
            self.boxView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
        }
        
        self.boxView.layer.cornerRadius = 10;
        self.boxView.layer.masksToBounds = YES;
        self.boxView.layer.borderWidth = 2;
        self.boxView.layer.borderColor = [UIColor clearColor].CGColor;
        
        [self initItemForTips];
    }
    return self;
}
- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect endRect = self.boxView.frame;
    self.boxView.frame = CGRectMake(0, 0, 0, 0);
    self.boxView.center = self.center;
    for (UIView *view in self.boxView.subviews) {
        view.alpha = 0;
    }
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.boxView.frame = endRect;
    } completion:^(BOOL finished) {
        for (UIView *view in self.boxView.subviews) {
            view.alpha = 1;
        }
    }];
    [window addSubview:self];
}
+ (void)hidden{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    TipView *view = (TipView*)[window viewWithTag:19911008];
    view.hidden = YES;
    [view removeFromSuperview];
}
- (void)setButtonCornerRadius:(CGFloat)value{
    for (UIView *view in self.boxView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*)view;
            button.layer.cornerRadius = value;
            button.layer.borderWidth = 2;
            button.layer.borderColor = [UIColor clearColor].CGColor;
            button.clipsToBounds = YES;
        }
    }
}

-(void)setButtonWithName:(NSString *)cancelName backgroundImage:(UIImage *)cancelImage{
    return [self setButtonWithName:cancelName backgroundImage:cancelImage andSure:nil backgroundImage:nil];
}
-(void)setButtonWithName:(NSString *)cancelName backgroundImage:(UIImage *)cancelImage andSure:(NSString *)sureName backgroundImage:(UIImage *)sureImage{
    
        CGRect msgFrame = ((UILabel*)[self viewWithTag:1008612]).frame;
       // 添加取消按钮
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(sureName == nil ? (SCREENWIDTH-60-100)/2:(SCREENWIDTH-200-60-FIXMAGIN)/2, FIXMAGIN+CGRectGetMaxY(msgFrame), 100, 30);
        [self.cancelButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.cancelButton.tag = 0;
       [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.cancelButton setBackgroundImage:cancelImage forState:UIControlStateNormal];
        [self.cancelButton setTitle:cancelName forState:UIControlStateNormal];
        [self.boxView addSubview:self.cancelButton];
        self.boxView.bounds = CGRectMake(0,0,SCREENWIDTH-60,CGRectGetMaxY(msgFrame)+30+FIXMAGIN*2);
    
      // 添加取消按钮
      if (cancelName !=nil) {
        self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sureButton.frame = CGRectMake((SCREENWIDTH-200-60-FIXMAGIN)/2+100+FIXMAGIN, FIXMAGIN+CGRectGetMaxY(msgFrame), 100, 30);
        [self.sureButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.sureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sureButton.tag = 1;
        [self.sureButton setBackgroundImage:sureImage forState:UIControlStateNormal];
        [self.sureButton setTitle:sureName forState:UIControlStateNormal];
        [self.boxView addSubview:self.sureButton];

    }
}
-(void)setTitleColor:(UIColor *)color{
    UILabel* label = (UILabel* )[self.boxView viewWithTag:1008611];
    label.textColor = color;
}
- (void)setMsgColor:(UIColor*)color{
    UILabel* label = (UILabel* )[self.boxView viewWithTag:1008612];
    label.textColor = color;
}
-(void)initItemForTips{
    
    CGSize titleSize = [self.title boundingRectWithSize:CGSizeMake(SCREENWIDTH-80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    UILabel* titleLable = [[UILabel alloc] initWithFrame:CGRectMake(LEFTMAGIN, TOPMAGIN, SCREENWIDTH-80, titleSize.height)];
    titleLable.text = self.title;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.numberOfLines = 0;
    titleLable.tag = 1008611;
    [self.boxView addSubview:titleLable];
  
    
   CGSize msgSize =[self.msg boundingRectWithSize:CGSizeMake(SCREENWIDTH-80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    UILabel* msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTMAGIN, titleLable.frame.origin.y+titleSize.height+FIXMAGIN, SCREENWIDTH-80, msgSize.height)];
    msgLabel.backgroundColor = [UIColor clearColor];
    msgLabel.font = [UIFont systemFontOfSize:14];
    msgLabel.text = self.msg;
    msgLabel.numberOfLines = 0;
    msgLabel.tag = 1008612;
    msgLabel.textAlignment = NSTextAlignmentCenter;
    [self.boxView addSubview:msgLabel];

    self.boxView.bounds = CGRectMake(0,0,SCREENWIDTH-60, msgLabel.frame.origin.y+msgSize.height+FIXMAGIN);
    NSLog(@"%f====%f===%f===%f",titleSize.height,msgSize.height,msgLabel.frame.origin.y+msgSize.height+FIXMAGIN,msgLabel.frame.origin.y);
    self.boxView.center = self.center;
    [self addSubview:self.boxView];

}

- (void)buttonClicked:(UIButton*)button{
    if (self.Delegate) {
        if ([self.Delegate respondsToSelector:@selector(alertView:buttonClickedAtIndex:)]){
            [self.Delegate alertView:self buttonClickedAtIndex:(int)button.tag];
            [TipView hidden];
        }
    }else{
        [TipView hidden];
    }
}
@end
