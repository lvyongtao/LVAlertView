//
//  LVAletView.h
//  UIBezierPath
//
//  Created by user on 15/11/24.
//  Copyright © 2015年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LVAletView;
@protocol LVALertviewDelegate<NSObject>
@optional
/**
 *  代理方法
 *
 *  @param index  0     点击------响应确定事件OK
    @param index  1              响应取消事件 弹出框消失
 */
-(void)didClickButtonWithLVAletView:(LVAletView *)alertView AtIndex:(NSUInteger)index;

@end
@interface LVAletView : UIView
@property (weak,nonatomic) id<LVALertviewDelegate> delegate;
/**
 *  API
 *
 *  @param title        ---------头标签    title!= nil
 *  @param message      ---------详细描述   message!= nil
 *  @param rightButton   点击------确定按钮（单个按钮设置titleRight != nil）
 *  @param leftButton    点击------取消按钮 （单个按钮设置titleLeft ＝ nil）
 *
 *  @return 
 */
-(instancetype)initWithTitle:(NSString *) title withMessage:(NSString *)message rightButton:(NSString *)titleRight leftButton:(NSString *)titleLeft;


@property (strong, nonatomic) UILabel *titleLable;

@property (strong, nonatomic) UIButton *rightButton;

@property (strong, nonatomic) UIButton *leftButton;

@property (strong, nonatomic) UILabel *messageLable;



@end
