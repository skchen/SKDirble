//
//  SKDirblePagedList.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/31.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SKUtils/SKUtils.h>

@class SKDirbleSiteList;

@interface SKDirblePagedList : NSObject<SKPagedList>

@property(nonatomic, assign) NSUInteger nextPage;

- (nonnull instancetype)initWithSiteList:(nonnull SKDirbleSiteList *)siteList pageSize:(NSUInteger)pageSize;

@end
