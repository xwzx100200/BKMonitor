//
//  BKLogViewController.m
//  BKMonitor
//
//  Created by i2p on 2021/8/9.
//

#import "BKLogViewController.h"

@interface BKLogViewController ()

@end

@implementation BKLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日志";
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    lab.text = @"这是日志内容";
    lab.textColor = [UIColor redColor];
    [self.view addSubview:lab];
}

@end
