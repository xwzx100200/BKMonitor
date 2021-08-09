//
//  BKLogViewController.m
//  BKMonitor
//
//  Created by i2p on 2021/8/9.
//

#import "BKLogViewController.h"
#import "BKLogData.h"
#import "BKMonitorMarcos.h"

@interface BKLogViewController ()
@property (nonatomic, strong)UITextView *logView;
@end

@implementation BKLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日志";
}

- (void)reloadData {
    NSString *iOSBuildVerStr = [self getIOSBuildVersion];
    NSString *logText = [BKLogData getLogText];
    NSString *logTextWithBuildStr = [NSString stringWithFormat:@"为便于查看，以下内容按照时间线倒序排列：%@\n%@",iOSBuildVerStr,logText];
    self.logView.text = logTextWithBuildStr;
}

///获取iOS端版本信息
-(NSString *)getIOSBuildVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //手机系统版本
    NSString *phoneSysVersion = [[UIDevice currentDevice] systemVersion];
    //app版本
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    //app build版本
    NSString *appBuild = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSString *build = [NSString stringWithFormat:@"当前iOS系统%@, app版本%@(%@)",phoneSysVersion, appCurVersion, appBuild];
    return build;
}

#pragma mark - Getter

- (UITextView *)logView {
    if (!_logView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        _logView = [[UITextView alloc]initWithFrame:CGRectMake(0, kTopMargin, width, height-kTopMargin)];
        _logView.editable = NO;
        _logView.font = [UIFont systemFontOfSize:15];
        _logView.backgroundColor = [UIColor magentaColor];
        [self.view addSubview:_logView];
    }
    return _logView;
}

@end
