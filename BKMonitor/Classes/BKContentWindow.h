//
//  BKContentWindow.h
//  BKMonitor
//
//  Created by i2p on 2021/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKContentWindow : UIWindow

@property (nonatomic, assign) BOOL isShow;

+ (instancetype)sharedInstance;

+ (void)destroyContentWindow;

@end

NS_ASSUME_NONNULL_END
