//
//  SYViewController.m
//  block和protocol传值
//
//  Created by 0X10 on 16/3/1.
//  Copyright © 2016年 crazy. All rights reserved.
//

#import "SYViewController.h"

@interface SYViewController ()

@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UITextField *field;
@end

@implementation SYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.field  = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-100, 200, 200, 40)];
    self.field.borderStyle = UITextBorderStyleRoundedRect;
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 300, 100, 40)];
    [self.btn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setTitle:@"返回" forState:UIControlStateNormal];
    self.btn.backgroundColor  = [UIColor blueColor];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.field];
}


- (void)backView{

    
    //protocol
    if (self.delegate&&[self.delegate respondsToSelector:@selector(useDelegateMethodSendData:)]) {
        
        //点击返回的时候，将要传的数据赋值给协议方法的参数
        [self.delegate useDelegateMethodSendData:self.field.text];
        [self.delegate printTransferString:self.field.text];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    //block
    if (self.NextViewControllerBlock) {
        self.NextViewControllerBlock(self.field.text);
    }
    //nsnotification
    [[NSNotificationCenter defaultCenter]postNotificationName:@"sendData" object:nil];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
