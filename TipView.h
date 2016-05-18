//
//  TipView.h
//  AlertTip
//
//  Created by jzl on 16/5/18.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TipViewDelegate <NSObject>
@required
-(void)alertTips:(id)alertTips buttonClickedAtIndex:(int)buttonIndex;

@end

@interface TipView : UIView
@property(nonatomic,strong)UIImage* tipBgImage;
@property(nonatomic,strong)UIView*  boxView;
@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)NSString* msg;
@property(nonatomic,strong)UIButton* sureButton;
@property(nonatomic,strong)UIButton* cancelButton;
@property(nonatomic,assign)id<TipViewDelegate>Delegate;

-(id)initWithBackgroundImage:(UIImage* )backgroundImage  andTitle:(NSString* )tips  andMsg:(NSString* )msg;
-(void)setButtonWithName:(NSString* )cancelName backgroundImage:(UIImage* )cancelImage;
-(void)setButtonWithName:(NSString* )cancelName backgroundImage:(UIImage* )cancelImage andSure:(NSString* )sureName backgroundImage:(UIImage* )sureImage;
- (void)setButtonCornerRadius:(CGFloat)value;
- (void)setTitleColor:(UIColor*)color;
- (void)setMsgColor:(UIColor*)color;
- (void)show;
- (void)hidden;

@end
