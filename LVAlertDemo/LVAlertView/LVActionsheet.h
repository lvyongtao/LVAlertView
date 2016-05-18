//
//  LVActionsheet.h
//  UIBezierPath
//
//  Created by user on 15/11/25.
//  Copyright © 2015年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LVActionsheet;
@protocol LVActionSheetDelegate<NSObject>
@optional
-(void)didClickButtonWithLVActionsheet:(LVActionsheet *)actionSheet AtTag:(NSUInteger)index;
@end
@interface LVActionsheet : UIView
@property (weak,nonatomic) id<LVActionSheetDelegate> delegate;
/**
 *  API
 *
 *  @param title           NSString
 *  @param otherButton     NSString
 *  @param cancelButton    NSString
 *  @param okButton        NSString
 *
 *  @return
 */
-(instancetype)initWithTitle:(NSString *) title
                 otherButton:(NSString *) otherButton
                CancelButton:(NSString *)cancelButton
                    OkButton:(NSString *)okButton;

@end
