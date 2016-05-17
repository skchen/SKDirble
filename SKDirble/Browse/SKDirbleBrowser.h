//
//  SKDirbleBrowser.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/16.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <SKUtils/SKPagedAsync.h>

@interface SKDirbleBrowser : SKPagedAsync

@property(nonatomic, assign) NSUInteger pageSize;

- (nonnull instancetype)initWithToken:(nonnull NSString *)token;

- (void)listMostPopularStations:(BOOL)refresh extend:(BOOL)extend success:(nonnull SKPagedListCallback)success failure:(nonnull SKErrorCallback)failure;
- (void)listRecentAddedStations:(BOOL)refresh extend:(BOOL)extend success:(nonnull SKPagedListCallback)success failure:(nonnull SKErrorCallback)failure;

@end
