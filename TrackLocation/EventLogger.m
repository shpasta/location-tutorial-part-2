//
//  ActionLogger.m
//  TrackLocation
//
//  Created by Stanislav Shpak on 1/8/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

#import "EventLogger.h"

@implementation EventLogger

+ (instancetype)sharedInstance {
    static EventLogger *eventLogger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        eventLogger = [[EventLogger alloc] init];
    });
    return eventLogger;
}

- (void)saveEvent:(NSString *)title {
    NSMutableArray *events = [[[EventLogger sharedInstance] events] mutableCopy];
    if (!events)
        events = [NSMutableArray new];
    NSDictionary *event = @{@"title": title,
                            @"date": [NSDate date]};
    [events addObject:event];
    
    [events writeToFile:[self filePath] atomically:YES];
}

- (NSArray *)events {
    return [NSArray arrayWithContentsOfFile:[self filePath]];
}

- (NSString *)filePath {
    // Get path to documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    return [paths.firstObject stringByAppendingPathComponent:@"file"];
}

@end
