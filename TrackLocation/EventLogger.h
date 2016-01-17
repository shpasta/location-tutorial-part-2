//
//  EventLogger.h
//  TrackLocation
//
//  Created by Stanislav Shpak on 1/8/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventLogger : NSObject

+ (instancetype)sharedInstance;

- (void)saveEvent:(NSString *)title;
- (NSArray *)events;

@end
