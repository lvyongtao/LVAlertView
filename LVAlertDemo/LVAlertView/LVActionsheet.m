//
//  LVActionsheet.m
//  UIBezierPath
//
//  Created by user on 15/11/25.
//  Copyright © 2015年 lvyongtao. All rights reserved.
//

#import "LVActionsheet.h"
#import "ACMacros.h"
#define titleH 50
#define buttonH 46
#define navgationH 64
#define miniSpaceY 2
#define spaceY 6
#define navH 64
#define lightBgColor [UIColor colorWithRed:31/255.0 green:36/255.0 blue:47/255.0 alpha:1]
#define deepBgColor [UIColor colorWithRed:56/255.0 green:62/255.0 blue:72/255.0 alpha:1]

@interface LVActionsheet ()
@property (strong,nonatomic)NSString *headTitle;
@property (strong,nonatomic)NSString *cancelButtonTitle;
@property (strong,nonatomic)NSString *okButtonTitle;
@property (strong,nonatomic)NSString *OtherButtonTitle;
@end

@implementation LVActionsheet

-(UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title
{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    //    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    button.backgroundColor= RGBCOLOR(40, 47, 54);
    button.titleLabel.textColor = RGBCOLOR(200, 200, 200);
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
//    button.layer.borderWidth = 2;
//    button.layer.borderColor = deepBgColor.CGColor;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)clickButton:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(didClickButtonWithLVActionsheet:AtTag:)]) {
        [self.delegate didClickButtonWithLVActionsheet:self AtTag:(button.tag -1)];
    }
    [self dismiss];
    
}
-(void)dismiss{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0,HEIGHT, WIDTH, buttonH);

    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    }
-(void)setUp{
//    self.layer.cornerRadius = 8.0;
//    self.clipsToBounds = YES;
//    self.backgroundColor = [UIColor redColor];
    CGRect cancleFrame = CGRectMake(0, miniSpaceY, WIDTH,buttonH);
    CGRect titleFrame = CGRectMake(0, 0, WIDTH, 0);
    if (self.headTitle.length!= 0 && self.headTitle!= nil) {
        //title
        titleFrame = CGRectMake(0, 0, WIDTH, titleH);
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.text= _headTitle;
        titleLable.backgroundColor =lightBgColor;
        titleLable.textColor = [UIColor whiteColor];
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont systemFontOfSize:13];
        titleLable.frame = titleFrame;
        [self addSubview:titleLable];
        cancleFrame = CGRectMake(0, titleFrame.size.height  , WIDTH,buttonH);
    }
    //确定
    if (self.okButtonTitle.length!= 0 && self.okButtonTitle!= nil) {
        cancleFrame = CGRectMake(0,  titleFrame.size.height + buttonH , WIDTH, buttonH);
        CGRect okFrame = CGRectMake(0, titleFrame.size.height, WIDTH, buttonH);
        UIButton *okbutton = [self createButtonWithFrame:okFrame Title:self.okButtonTitle];
        okbutton.tag = 2;
        [self addSubview:okbutton];
    }
    //其他
    if (self.OtherButtonTitle.length!= 0 && self.OtherButtonTitle!= nil) {
        cancleFrame = CGRectMake(0,  titleFrame.size.height + buttonH*2 + spaceY + miniSpaceY , WIDTH, buttonH);
        CGRect otherFrame = CGRectMake(0,  titleFrame.size.height + buttonH + miniSpaceY, WIDTH, buttonH);
        UIButton *otherbutton = [self createButtonWithFrame:otherFrame Title:self.OtherButtonTitle];
        otherbutton.tag = 3;
        [self addSubview:otherbutton];
    }
    //取消
    UIButton *cancleButton = [self createButtonWithFrame:cancleFrame Title:self.cancelButtonTitle];
    cancleButton.tag = 1;
    [self addSubview:cancleButton];
    
    self.frame = CGRectMake(0,HEIGHT, WIDTH, cancleFrame.size.height + cancleFrame.origin.y);
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0,HEIGHT + navH -cancleFrame.origin.y -cancleFrame.size.height -navgationH, WIDTH, cancleFrame.size.height + cancleFrame.origin.y +spaceY + miniSpaceY);
    }];
 
};

#pragma mark -  API
-(instancetype)initWithTitle:(NSString *) title
                 otherButton:(NSString *) otherButton
                CancelButton:(NSString *)cancelButton
                    OkButton:(NSString *)okButton{
    if (self = [super initWithFrame:self.frame]) {
            self.headTitle = title;
            self.OtherButtonTitle = otherButton;
            self.cancelButtonTitle = cancelButton;
            self.okButtonTitle = okButton;
            [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
