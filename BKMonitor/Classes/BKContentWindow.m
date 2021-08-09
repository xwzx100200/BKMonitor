//
//  BKContentWindow.m
//  BKMonitor
//
//  Created by i2p on 2021/8/9.
//

#import "BKContentWindow.h"
#import "BKLogViewController.h"

@implementation BKContentWindow

static BKContentWindow *contentWindow = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (contentWindow == nil) {
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            CGFloat height = [UIScreen mainScreen].bounds.size.height;
            contentWindow = [[self alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        }
    });
    return contentWindow;
}

+ (void)destroyContentWindow {
    if (contentWindow) {
        contentWindow = nil;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        BKLogViewController* logVC = [[BKLogViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:logVC];
        self.rootViewController = navi;
        self.isShow = NO;
        self.backgroundColor = [UIColor whiteColor];
        self.windowLevel = UIWindowLevelStatusBar + 9;
    }
    return self;
}

- (void)setIsShow:(BOOL)isShow {
    _isShow = isShow;
    self.hidden = !isShow;
}

@end
