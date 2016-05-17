//
//  SKDirbleExtendableList.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/17.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKDirbleExtendableList : NSObject

@property(nonatomic, copy, readonly, nullable) NSString *nextPageToken;
@property(nonatomic, copy, readonly, nonnull) NSArray *objects;
@property(nonatomic, readonly) BOOL finished;

@end
