//
//  SKDirbleSite.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/6/2.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirbleSite.h"

static NSString * const kKeySiteName = @"name";
static NSString * const kKeySiteStreams = @"streams";
static NSString * const kKeySiteStreamUri = @"stream";

@implementation SKDirbleSite

- (nullable NSString *)name {
    return [_json objectForKey:kKeySiteName];
}

- (nullable NSString *)uri {
    NSArray *streams = [_json objectForKey:kKeySiteStreams];
    if([streams count]>0) {
        NSDictionary *stream = [streams objectAtIndex:0];
        return [stream objectForKey:kKeySiteStreamUri];
    }
    
    return nil;
}

@end
