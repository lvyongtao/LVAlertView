//
//  ViewController.m
//  LVAlertDemo
//
//  Created by user on 16/2/2.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "ViewController.h"
#import "LVAletView.h"
#import "LVActionsheet.h"
@interface ViewController ()<LVALertviewDelegate,LVActionSheetDelegate>



@property (strong, nonatomic) LVAletView *alertView;

@property (strong, nonatomic) LVAletView *alertView1;

@property (strong, nonatomic) LVActionsheet *actionSheet;
@property (strong, nonatomic) LVActionsheet *actionSheet1;

@end

@implementation ViewController
- (IBAction)alertViewBtn:(UIButton *)sender {
    
    
    
       self.alertView.backgroundColor = [UIColor grayColor];
    
    
//    if (!sender.selected) {
//        
//       
//        
//        self.alertView.backgroundColor = [UIColor grayColor];
////         self.alertView1.backgroundColor = [UIColor grayColor];
////        sender.selected = YES;
//    }else{
////        sender.selected = NO;
////        [self.alertView removeFromSuperview];
//        
//    }
   
    
  }
- (IBAction)actionSheetBtn:(UIButton *)sender {
        self.actionSheet.backgroundColor = [UIColor whiteColor];
//    if (!sender.selected) {
//       
//        self.actionSheet.backgroundColor = [UIColor whiteColor];
//        sender.selected = YES;
//    }else{
//        sender.selected = NO;
////        [self.actionSheet removeFromSuperview];
//        
//    }
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatUI];
}

- (LVActionsheet *)actionSheet{
    if (!_actionSheet) {
        _actionSheet = [[LVActionsheet alloc] initWithTitle:@"" otherButton:@"data" CancelButton:@"取消" OkButton:@"确定"];
        _actionSheet.delegate = self;
       [self.view addSubview:_actionSheet];
    }
    return _actionSheet;
    
}
- (LVActionsheet *)actionSheet1{
    if (!_actionSheet1) {
        _actionSheet1 = [[LVActionsheet alloc] initWithTitle:@"" otherButton:@"data" CancelButton:@"取消" OkButton:@"确定"];
        _actionSheet1.delegate = self;
        [self.view addSubview:_actionSheet1];
    }
    return _actionSheet1;
    
}

- (LVAletView *)alertView1{
    if (!_alertView1) {
        _alertView1 = [[LVAletView alloc] initWithTitle:@"提示" withMessage:@"1" rightButton:@"确定" leftButton:@"取消"];
        _alertView1.delegate =self;
        
        NSLog(@"---%@",_alertView1.description);
         [self.view addSubview:_alertView1];
        
    }
    return _alertView;
}

- (LVAletView *)alertView{
    if (!_alertView) {
        _alertView = [[LVAletView alloc] initWithTitle:@"提示" withMessage:@"1" rightButton:@"确定" leftButton:@"取消"];
        _alertView.delegate =self;
        
        NSLog(@"%@",_alertView.description);
        [self.view addSubview:_alertView];
        
    }
    return _alertView;
}

#pragma mark --Delegate
- (void)didClickButtonWithLVAletView:(LVAletView *)alertView AtIndex:(NSUInteger)index{
    if ([alertView isEqual:_alertView]) {
       NSLog(@"%@",alertView.description);
    }else{
          NSLog(@"--%@",alertView.description);
    }
    
    
}

- (void)didClickButtonWithLVActionsheet:(LVActionsheet *)actionSheet AtTag:(NSUInteger)index{
    NSLog(@"%@",actionSheet.description);

}



- (void)creatUI{
    
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
