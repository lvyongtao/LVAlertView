//
//  LVAletView.m
//  UIBezierPath
//
//  Created by user on 15/11/24.
//  Copyright © 2015年 lvyongtao. All rights reserved.
//

#import "LVAletView.h"
#import "ACMacros.h"

#define alertW 257
#define alertH 176

#define buttonH 50

#define spaceX 40
#define spaceY 33

#define titleH 25

#define messageH 17


#define GZGreen [UIColor colorWithRed:124/255.0 green:228/255.0 blue:77/255.0 alpha:1]
@interface LVAletView ()


{
    
    
    CGSize _titlSize;
    
    CGSize _messageSize;
}

//
@property (copy,nonatomic)NSString * title;
//
@property (copy,nonatomic)NSString * rightTitle;
//
@property (copy,nonatomic)NSString * leftTitle;
//提示信息
@property(copy,nonatomic)NSString *message;


@property (strong, nonatomic) UIImageView *lineLeft;

@end
@implementation LVAletView

#pragma mark -  UI
-(UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title
{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
//    button.backgroundColor= kUIColor(57, 60, 71);
    button.titleLabel.textColor = [UIColor greenColor];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
//    button.layer.borderWidth = 0.5;
//    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)clickButton:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(didClickButtonWithLVAletView:AtIndex:)]) {
        [self.delegate didClickButtonWithLVAletView:self AtIndex:(button.tag -1)];
    }
    [self dismiss];
}
-(void)dismiss{
    float selfX = WIDTH/2 - alertW/2;
    float selfY = HEIGHT/2- alertH/2;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(selfX, selfY, alertW, 0);;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
   
}
-(void)setUp{
    self.backgroundColor = RGBCOLOR(73, 78, 88);
    self.layer.cornerRadius = 8.0;
    self.clipsToBounds = YES;
    //titleLable
    _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceY, alertW, _titlSize.height)];
    _titleLable.text =self.title;
    _titleLable.numberOfLines = 0;
//    _titleLable.backgroundColor = [UIColor redColor];
    _titleLable.font =[UIFont systemFontOfSize:16];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.textColor = RGBCOLOR(234, 234, 234);
    [self addSubview:_titleLable];
    //massageLable
    _messageLable = [[UILabel alloc] initWithFrame:CGRectMake(spaceX, _titlSize.height + spaceY + 10, alertW - spaceX*2, _messageSize.height)];
//    _messageLable.backgroundColor = [UIColor redColor];
//    _messageLable.text =self.message;
    _messageLable.numberOfLines = 0;
    _messageLable.font=[UIFont systemFontOfSize:12];
    _messageLable.textAlignment = NSTextAlignmentCenter;
//    _messageLable.textColor =kUIColor(234, 234, 234);
    _messageLable.attributedText = [self setColorWithString:self.message withColor1:RGBCOLOR(234, 234, 234) withColor2:GZGreen];
    [self addSubview:_messageLable];
    
    
    
 
    
//    float buttonYY = _titlSize.height + 25 + 10 + _titlSize.height + 16;
    float buttonYY = alertH - buttonH;
   
    CGRect rightFrame = CGRectMake(0, buttonYY ,alertW,buttonH);
    
    
    
  
    
    
    
    if (self.leftTitle.length != 0 && self.leftTitle !=nil){
        rightFrame =CGRectMake(alertW/2, buttonYY, alertW/2, buttonH);
        CGRect leftFrame = CGRectMake(0, buttonYY, alertW/2 - 2, buttonH);
        _leftButton = [self createButtonWithFrame:leftFrame Title:self.leftTitle];
        _leftButton.titleLabel.font =[UIFont systemFontOfSize:16];
//        [_leftButton setBackgroundColor:[UIColor greenColor]];
        
        UIImageView *singleLine =[[UIImageView alloc] init];
        singleLine.backgroundColor = RGBCOLOR(81, 86, 96);
        singleLine.frame = CGRectMake(leftFrame.origin.x + leftFrame.size.width, leftFrame.origin.y, 1, buttonH);
        [self addSubview:singleLine];

        
        
        _leftButton.tag = 2;
        [self addSubview:_leftButton];
    }
    
    _lineLeft=[[UIImageView alloc] init];
    _lineLeft.backgroundColor =RGBCOLOR(81, 86, 96);
    _rightButton =[self createButtonWithFrame:rightFrame Title:_rightTitle];
    _rightButton.titleLabel.font =[UIFont systemFontOfSize:16];
    _lineLeft.frame = CGRectMake(- alertW/2, 0, alertW*2, 1);
//    [_rightButton setBackgroundColor:[UIColor redColor]];
    [_rightButton addSubview:_lineLeft];
    
    _rightButton.tag =1;
    [self addSubview:_rightButton];
   
//    cancleButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    cancleButton.layer.borderWidth = 1;
    
    float selfX = WIDTH/2 - alertW/2;
    float selfY = HEIGHT/2- alertH/2;
    self.frame = CGRectMake(selfX, selfY, alertW, 0);
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(selfX, selfY, alertW, alertH);
    }];
  
   
}
#pragma mark -  API
-(instancetype)initWithTitle:(NSString *) title withMessage:(NSString *)message rightButton:(NSString *)titleRight leftButton:(NSString *)titleLeft{
    if (self = [super initWithFrame:self.frame]) {
        self.title = title;
        self.message=message;
        self.rightTitle = titleRight;
        self.leftTitle = titleLeft;
       _titlSize = [self sizeWithString:title fount:[UIFont systemFontOfSize:18] maxSize:CGSizeMake(alertW, 25)];
       _messageSize  = [self sizeWithString:message fount:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(alertW -spaceX *2, 50)];
      
        
        
        [self setUp];
    }
    return self;
}


-(CGSize)sizeWithString:(NSString *)str fount:(UIFont *)fount maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName:fount};
    NSString *string=[str stringByReplacingOccurrencesOfString:@"\\n" withString: @"\n"];
    NSArray *arr=[string componentsSeparatedByString:@"\n"];
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    size.height=size.height+arr.count*3;
    return size;
}



-(NSMutableAttributedString *)setColorWithString:(NSString *)str  withColor1:(UIColor *)color1 withColor2:(UIColor *)color2
{
  
    NSArray *array = [str componentsSeparatedByString:@" "];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];

    NSLog(@"%lu",(unsigned long)array.count);
    if (array && array.count > 1) {
        NSString *leftString = array[0];
        NSString *centerString = array[1];
        NSString *rightString = array[2];

        [attributedStr addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, leftString.length)];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(leftString.length + 1, centerString.length + 1)];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(centerString.length + leftString.length + 1, rightString.length + 1)];
    }else{
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, str.length)];
    }
   
    
    
    return attributedStr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
