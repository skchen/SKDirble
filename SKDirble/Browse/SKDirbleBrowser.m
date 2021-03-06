//
//  SKDirbleBrowser.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/16.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirbleBrowser.h"

#import "SKDirblePagedList.h"
#import "SKDirbleApi.h"

#import "SKDirbleSiteList.h"

@import SKUtils;

static const NSUInteger kPageSizeDefault = 30;

static NSString * const kCacheKeyPrefix = @"prefix";

static NSString * const kCacheKeyPrefixMostPopular = @"mostPopular";
static NSString * const kCacheKeyPrefixRecentAdded = @"recentAdded";

typedef SKDirbleSiteList * _Nullable (^SKDirblePagedListRequest)(NSInteger pageIndex, NSError * _Nullable * _Nullable errorPtr);

@interface SKDirbleBrowser ()

@property(nonatomic, copy, readonly, nonnull) NSString *token;

@end

@implementation SKDirbleBrowser

- (nonnull instancetype)initWithToken:(nonnull NSString *)token {
    self = [super init];
    
    _pageSize = kPageSizeDefault;
    
    _token = token;
    
    return self;
}

- (void)listMostPopularStations:(BOOL)refresh extend:(BOOL)extend success:(nonnull SKPagedListCallback)success failure:(nonnull SKErrorCallback)failure {
    
    NSDictionary *cacheKey = [self cacheKey:kCacheKeyPrefixMostPopular];
    
    SKPagedListRequest dirblePagedListRequest = [self dirbleSiteListPagedRequest:^SKDirbleSiteList * _Nullable(NSInteger pageIndex, NSError *__autoreleasing  _Nullable * _Nullable errorPtr) {
        return [SKDirbleApi listPopularStations:_token pageIndex:pageIndex pageSize:_pageSize error:errorPtr];
    }];
    
    [self pagedList:refresh extend:extend cacheKey:cacheKey request:dirblePagedListRequest success:success failure:failure];
}

- (void)listRecentAddedStations:(BOOL)refresh extend:(BOOL)extend success:(nonnull SKPagedListCallback)success failure:(nonnull SKErrorCallback)failure {
    
    NSDictionary *cacheKey = [self cacheKey:kCacheKeyPrefixRecentAdded];
    
    SKPagedListRequest dirblePagedListRequest = [self dirbleSiteListPagedRequest:^SKDirbleSiteList * _Nullable(NSInteger pageIndex, NSError *__autoreleasing  _Nullable * _Nullable errorPtr) {
        return [SKDirbleApi listRecentAddedStations:_token pageIndex:pageIndex pageSize:_pageSize error:errorPtr];
    }];
    
    [self pagedList:refresh extend:extend cacheKey:cacheKey request:dirblePagedListRequest success:success failure:failure];
}

- (nonnull SKPagedListRequest)dirbleSiteListPagedRequest:(nonnull SKDirblePagedListRequest)dirbleRequest {
    return ^ id<SKPagedList> _Nullable (id<SKPagedList> _Nullable pagedList, NSError * _Nullable * _Nullable errorPtr) {
        
        SKDirblePagedList *dirblePagedList = (SKDirblePagedList *)pagedList;
        NSUInteger pageIndex = 0;
        if(dirblePagedList) {
            pageIndex = dirblePagedList.nextPage;
        }
        
        SKDirbleSiteList *pagedResults = dirbleRequest(pageIndex, errorPtr);
        
        if(!(*errorPtr)) {
            return [[SKDirblePagedList alloc] initWithSiteList:pagedResults pageSize:_pageSize];
        }
        
        return nil;
    };
}

- (nonnull NSDictionary *)cacheKey:(nonnull NSString *)prefix {
    NSMutableDictionary *cacheKey = [[NSMutableDictionary alloc] init];
    [cacheKey setObject:prefix forKey:kCacheKeyPrefix];
    return cacheKey;
}

@end
