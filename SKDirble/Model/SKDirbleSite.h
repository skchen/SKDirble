//
//  SKDirbleSite.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/6/2.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirbleModel.h"

@interface SKDirbleSite : SKDirbleModel

@property(nonatomic, copy, nullable, readonly) NSString *name;
@property(nonatomic, copy, nullable, readonly) NSString *uri;

@end
