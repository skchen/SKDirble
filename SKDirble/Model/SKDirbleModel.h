//
//  SKDirbleModel.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/6/1.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKDirbleModel : NSObject {
    @protected
    id _json;
}

- (nullable instancetype)initWithJson:(nonnull id)json;

@end
