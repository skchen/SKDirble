//
//  SKDirbleApi.h
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/16.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

@import SKUtils;

@class SKDirbleObject;

@interface SKDirbleApi : NSObject

+ (nullable NSArray *)listRecentAddedStations:(nonnull NSString *)token pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listPopularStations:(nonnull NSString *)token pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr;

+ (nullable NSArray *)listCategories:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listPrimaryCategories:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listChildCategories:(nonnull NSString *)token primaryCategory:(NSInteger)primaryCategoryId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listStations:(nonnull NSString *)token category:(NSInteger)categoryId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr;

+ (nullable NSArray *)searchStations:(nonnull NSString *)token query:(nonnull NSString *)query pageIndex:(NSUInteger)pageIndex error:(NSError * _Nullable * _Nullable)errorPtr;

+ (nullable NSArray *)listCountries:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listContinents:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listCountries:(nonnull NSString *)token continent:(NSInteger)continentId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr;
+ (nullable NSArray *)listStations:(nonnull NSString *)token country:(nonnull NSString *)countryId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr;

@end
