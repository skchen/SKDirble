//
//  SKDirblePagedList.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/31.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SKUtils/SKUtils.h>

@interface SKDirblePagedList : NSObject<SKPagedList>

@property(nonatomic, assign) NSUInteger nextPage;

- (nonnull instancetype)initWithPageSize:(NSUInteger)pageSize;

- (void)addObjectsFromArray:(nonnull NSArray *)otherArray;

@end
