//
//  SKDirblePagedList.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/31.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirblePagedList.h"

#import "SKDirbleSiteList.h"

@interface SKDirblePagedList ()

@property(nonatomic, strong, readonly, nonnull) NSMutableArray *mutableList;
@property(nonatomic, readonly) NSUInteger pageSize;

@end

@implementation SKDirblePagedList

@synthesize finished;

- (nonnull instancetype)initWithSiteList:(nonnull SKDirbleSiteList *)siteList pageSize:(NSUInteger)pageSize {
    self = [super init];
    
    _mutableList = [[NSMutableArray alloc] init];
    _pageSize = pageSize;
    _nextPage = 0;
    
    [self addObjectsFromArray:siteList.sites];
    
    return self;
}

- (nonnull NSArray *)list {
    return _mutableList;
}

- (void)append:(id)newPage {
    if([newPage conformsToProtocol:@protocol(SKPagedList)]) {
        [self addObjectsFromArray:((id<SKPagedList>)newPage).list];
    }
}

- (void)addObjectsFromArray:(nonnull NSArray *)otherArray {
    [_mutableList addObjectsFromArray:otherArray];
    _nextPage++;
    finished = ([otherArray count]<_pageSize);
}

@end
