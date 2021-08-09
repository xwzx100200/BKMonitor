//
//  BKMonitorMarcos.h
//  BKMonitor
//
//  Created by i2p on 2021/8/10.
//

#ifndef BKMonitorMarcos_h
#define BKMonitorMarcos_h

#define kIsIPhoneX ([[UIScreen mainScreen] nativeBounds].size.height >= 2436.0)
#define kTopMargin (kIsIPhoneX ? 88.0 : 64.0)
#define kBottomMargin (kIsIPhoneX ? 83.0 : 49.0)
#define kTopHeight (kIsIPhoneX ? 44:20) //顶部状态栏高度
#define kBottomHeight (kIsIPhoneX ? 34: 0)

#endif /* BKMonitorMarcos_h */
