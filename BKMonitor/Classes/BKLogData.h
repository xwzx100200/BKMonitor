//
//  BKLogData.h
//  BKMonitor
//
//  Created by i2p on 2021/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKLogData : NSObject

+ (NSArray *)getLogArray;
+ (NSString *)getLogText;
+ (void)clearLogText;
+ (void)insertLog:(NSString*)log;

@end

NS_ASSUME_NONNULL_END
