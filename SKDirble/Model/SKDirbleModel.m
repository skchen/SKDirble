//
//  SKDirbleModel.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/6/1.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirbleModel.h"

@interface SKDirbleModel ()

@property(nonatomic, strong, nonnull, readonly) id json;

@end

@implementation SKDirbleModel

- (nullable instancetype)initWithJson:(nonnull id)json {
    self = [super init];
    _json = json;
    return self;
}

- (NSString *)description {
    return [_json description];
}

@end
