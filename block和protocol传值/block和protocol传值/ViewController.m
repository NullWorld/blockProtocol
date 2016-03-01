//
//  ViewController.m
//  block和protocol传值
//
//  Created by 0X10 on 16/3/1.
//  Copyright © 2016年 crazy. All rights reserved.
//

#import "ViewController.h"
#import "SYViewController.h"

@interface ViewController ()<sendDataDelegate>

@property (nonatomic,strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 300, 100, 40)];
    [self.btn addTarget:self action:@selector(pushView) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setTitle:@"下一页" forState:UIControlStateNormal];
    self.btn.backgroundColor  = [UIColor blueColor];
    [self.view addSubview:self.btn];
    
    //创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setupBtn) name:@"sendData" object:nil];
}

- (void)setupBtn{
    NSLog(@"通知的反向传值");
}

#pragma  mark - this method（protocol and block）  -
- (void)pushView{
    SYViewController *sy  = [[SYViewController alloc]init];
    sy.delegate = self;
  //  sy.NextViewControllerBlock = ^(NSString *str){
  //      [self.btn setTitle:str forState:UIControlStateNormal];
   // };
    [self.navigationController pushViewController:sy animated:YES];
}


- (void)printTransferString:(NSString *)transferString{
    NSLog(@"传输的数据为:%@",transferString);
}

- (void)useDelegateMethodSendData:(NSString *)transferString{
    [self.btn setTitle:transferString forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
