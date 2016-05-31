//
//  SKDirblePagedList.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/31.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirblePagedList.h"

@interface SKDirblePagedList ()

@property(nonatomic, strong, readonly, nonnull) NSMutableArray *mutableList;
@property(nonatomic, readonly) NSUInteger pageSize;

@end

@implementation SKDirblePagedList

@synthesize finished;

- (nonnull instancetype)initWithPageSize:(NSUInteger)pageSize {
    self = [super init];
    
    _mutableList = [[NSMutableArray alloc] init];
    _pageSize = pageSize;
    _nextPage = 0;
    
    return self;
}

- (nonnull NSArray *)list {
    return _mutableList;
}

- (void)addObjectsFromArray:(nonnull NSArray *)otherArray {
    [_mutableList addObjectsFromArray:otherArray];
    _nextPage++;
    finished = ([otherArray count]<_pageSize);
}

@end
