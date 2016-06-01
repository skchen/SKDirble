//
//  SKDirbleSiteList.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/6/1.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirbleSiteList.h"
#import "SKDirbleSite.h"

@interface SKDirbleSiteList ()

@property(nonatomic, strong, readonly, nonnull) NSMutableArray *mutableSites;

@end

@implementation SKDirbleSiteList

- (nullable instancetype)initWithJson:(id)json {
    self = [super initWithJson:json];
    
    _mutableSites = [[NSMutableArray alloc] init];
    
    NSArray *siteJsonArray = (NSArray *)_json;
    
    for(NSDictionary *siteJson in siteJsonArray) {
        SKDirbleSite *site = [[SKDirbleSite alloc] initWithJson:siteJson];
        [_mutableSites addObject:site];
    }
    
    return self;
}

- (nonnull NSArray *)sites {
    return _mutableSites;
}

@end
