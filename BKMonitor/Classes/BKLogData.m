//
//  BKLogData.m
//  BKMonitor
//
//  Created by i2p on 2021/8/10.
//

#import "BKLogData.h"

@interface BKLogData ()
@property (nonatomic, strong) NSMutableArray *logDataArray;
@end

@implementation BKLogData

static dispatch_queue_t _queue = nil;

+ (void)load {
    _queue = dispatch_queue_create("bkApp.log.com", DISPATCH_QUEUE_SERIAL);
}

+ (BKLogData *)sharedInstance {
    static BKLogData *logData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logData = [[BKLogData alloc] init];
    });
    return logData;
}
                  
+ (NSArray *)getLogArray {
    return [[BKLogData sharedInstance].logDataArray copy];;
}

+ (NSString *)getLogText {
    NSMutableString *resultString = [[NSMutableString alloc] initWithString:@""];
    
    NSArray *dataArray = [[BKLogData sharedInstance].logDataArray copy];
    for (NSString *string in dataArray) {
        [resultString appendFormat:@"\n%@\n", string];
    }
    return resultString;
}

+ (void)clearLogText {
    dispatch_async(_queue, ^{
        [[BKLogData sharedInstance].logDataArray removeAllObjects];
    });
}

+ (void)insertLog:(NSString*)log {
    dispatch_async(_queue, ^{
        [[BKLogData sharedInstance].logDataArray insertObject:log atIndex:0];
    });
}

- (NSMutableArray *)logDataArray
{
    if (!_logDataArray) {
        _logDataArray = [[NSMutableArray alloc] init];
    }
    return _logDataArray;
}

@end

