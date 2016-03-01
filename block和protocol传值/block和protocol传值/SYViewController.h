//
//  SYViewController.h
//  block和protocol传值
//
//  Created by 0X10 on 16/3/1.
//  Copyright © 2016年 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sendDataDelegate <NSObject>

@required

- (void)useDelegateMethodSendData:(NSString *)transferString;

//遵循协议后，必须调用的方法
@optional

- (void)printTransferString:(NSString *)transferString;

@end

@interface SYViewController : UIViewController

@property (nonatomic,assign)id <sendDataDelegate> delegate;

//声明一个无返回值的block函数，参数只有一个String
@property (nonatomic, copy) void (^NextViewControllerBlock)(NSString *tfText);

@end
