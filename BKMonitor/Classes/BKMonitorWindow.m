//
//  BKMonitorWindow.m
//  WLMonitor
//
//  Created by i2p on 2021/8/9.
//

#import "BKMonitorWindow.h"
#import "BKContentWindow.h"
#import "BKMonitorMarcos.h"

#define kHiddenProportion 0.14545455

@implementation BKMonitorWindow

static BKMonitorWindow *monitorWindow = nil;

+ (void)createMonitorWindow {
    @synchronized(self) {
        if (monitorWindow == nil) {
            monitorWindow = [[self alloc] initWithFrame:CGRectMake(0, 300, 68, 52)];
        }
    }
}

+ (void)destroyMonitorWindow {
    if (monitorWindow) {
        monitorWindow = nil;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
        self.rootViewController = [[UIViewController alloc] init];
        self.hidden = NO;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        view.backgroundColor = [UIColor blueColor];
        [self.rootViewController.view addSubview:view];
        
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelStatusBar + 10;

        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        pan.delaysTouchesBegan = YES;
        [self addGestureRecognizer:pan];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)]];
    }
    return self;
}


#pragma mark - event response
- (void)handlePanGesture:(UIPanGestureRecognizer*)p {
    UIWindow *appWindow = [UIApplication sharedApplication].delegate.window;
    CGPoint panPoint = [p locationInView:appWindow];
    
    if (p.state == UIGestureRecognizerStateBegan) {
        // ...
    } else if (p.state == UIGestureRecognizerStateChanged) {
        self.center = CGPointMake(panPoint.x, panPoint.y);
    } else if (p.state == UIGestureRecognizerStateEnded
             || p.state == UIGestureRecognizerStateCancelled) {
        CGPoint newCenter = [[self class] checkNewCenterWithPoint:panPoint size:self.frame.size];
        [UIView animateWithDuration:.25 animations:^{
            self.center = newCenter;
        } completion:^(BOOL finished) {
            // ...
        }];
    } else {
        // ...
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer *)gesture {
    BKContentWindow *window = [BKContentWindow sharedInstance];
    window.isShow = !window.isShow;
    NSLog(@"handleTapGesture");
}

#pragma mark - private methods
+ (CGPoint)checkNewCenterWithPoint:(CGPoint)point size:(CGSize)size {
    CGFloat ballWidth = size.width;
    CGFloat ballHeight = size.height;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat left = fabs(point.x);
    CGFloat right = fabs(screenWidth - left);
    
    CGPoint newCenter = CGPointZero;
    CGFloat targetY = 0;
    
    //Correcting Y
    if (point.y < kTopMargin + ballHeight / 2.0) {
        targetY = kTopMargin + ballHeight / 2.0;
    } else if (point.y > (screenHeight - ballHeight / 2.0 - kBottomMargin)) {
        targetY = screenHeight - ballHeight / 2.0 - kBottomMargin;
    } else {
        targetY = point.y;
    }
    
    CGFloat centerXSpace = (0.5) * ballWidth + kHiddenProportion;
    if (left <= right) {
        newCenter = CGPointMake(centerXSpace, targetY);
    } else {
        newCenter = CGPointMake(screenWidth - centerXSpace, targetY);
    }
    return newCenter;
}


@end
