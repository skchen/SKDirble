//
//  SKDirbleApi.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/16.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "SKDirbleApi.h"

@implementation SKDirbleApi

static NSString * const kApiStations = @"v2/stations";
static NSString * const kApiRecentAddedStations = @"v2/stations/recent";
static NSString * const kApiPopularStations = @"v2/stations/popular";

static NSString * const kApiCategories = @"v2/categories";
static NSString * const kApiPrimaryCategories = @"v2/categories/primary";
static NSString * const kApiChildCategories = @"v2/category/%@/childs";
static NSString * const kApiStationsInCategory = @"v2/category/%@/stations";

static NSString * const kApiSearch = @"v2/search/%@";

static NSString * const kApiCountries = @"v2/countries";
static NSString * const kApiContinents = @"v2/continents";
static NSString * const kApiCountriesInContinent = @"v2/continents/%@/countries";
static NSString * const kApiStationsInCountry = @"v2/countries/%@/stations";

static NSString * const kParameterToken = @"token";
static NSString * const kParameterPageIndex = @"page";
static NSString * const kParameterPageSize = @"per_page";

+ (nullable NSArray *)listStations:(nonnull NSString *)token pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {

    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:kApiStations andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listRecentAddedStations:(nonnull NSString *)token pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {

    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:kApiRecentAddedStations andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listPopularStations:(nonnull NSString *)token pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {

    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:kApiPopularStations andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listCategories:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr {
    
    NSDictionary *parameter = @{
                                kParameterToken : token
                                };
    
    return [SKDirbleApi objectForApi:kApiCategories andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listPrimaryCategories:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr {
    
    NSDictionary *parameter = @{
                                kParameterToken : token
                                };
    
    return [SKDirbleApi objectForApi:kApiPrimaryCategories andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listChildCategories:(nonnull NSString *)token primaryCategory:(NSInteger)primaryCategoryId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {
    
    NSString *api = [NSString stringWithFormat:kApiChildCategories, @(primaryCategoryId)];

    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:api andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listStations:(nonnull NSString *)token category:(NSInteger)categoryId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {

    NSString *api = [NSString stringWithFormat:kApiStationsInCategory, @(categoryId)];
    
    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:api andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listStations:(nonnull NSString *)token keyword:(nonnull NSString *)keyword pageIndex:(NSUInteger)pageIndex error:(NSError * _Nullable * _Nullable)errorPtr {

    NSString *api = [NSString stringWithFormat:kApiSearch, keyword];
    
    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex)
                                };
    
    return [SKDirbleApi objectForApi:api andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listCountries:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr {

    NSDictionary *parameter = @{
                                kParameterToken : token
                                };
    
    return [SKDirbleApi objectForApi:kApiCountries andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listContinents:(nonnull NSString *)token error:(NSError * _Nullable * _Nullable)errorPtr {

    NSDictionary *parameter = @{
                                kParameterToken : token
                                };
    
    return [SKDirbleApi objectForApi:kApiContinents andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listCountries:(nonnull NSString *)token continent:(NSInteger)continentId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {

    NSString *api = [NSString stringWithFormat:kApiCountriesInContinent, @(continentId)];
    
    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:api andParameter:parameter error:errorPtr];
}

+ (nullable NSArray *)listStations:(nonnull NSString *)token country:(nonnull NSString *)countryId pageIndex:(NSUInteger)pageIndex pageSize:(NSUInteger)pageSize error:(NSError * _Nullable * _Nullable)errorPtr {

    NSString *api = [NSString stringWithFormat:kApiStationsInCountry, countryId];
    
    NSDictionary *parameter = @{
                                kParameterToken : token,
                                kParameterPageIndex : @(pageIndex),
                                kParameterPageSize : @(pageSize)
                                };
    
    return [SKDirbleApi objectForApi:api andParameter:parameter error:errorPtr];
}

+ (nullable id)objectForApi:(nonnull NSString *)api andParameter:(nullable NSDictionary *)parameter error:(NSError **)errorPtr {

    NSString *urlString = [SKDirbleApi urlForScheme:@"https" Host:@"api.dirble.com" andPort:443 andApi:api andParameter:parameter];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if(data) {
        return [NSJSONSerialization JSONObjectWithData:data options:0 error:errorPtr];
    } else {
        *errorPtr = [NSError errorWithDomain:@"Request failed" code:0 userInfo:nil];
        return nil;
    }
}

+ (nonnull NSString *)urlForScheme:(nonnull NSString *)scheme Host:(nonnull NSString *)host andPort:(NSUInteger)port andApi:(nonnull NSString *)api andParameter:(nullable NSDictionary *)parameter {
    
    return [NSString stringWithFormat:@"%@://%@:%@/%@%@", scheme, host, @(port), api, [SKDirbleApi queryForParameter:parameter]];
}

+ (nonnull NSString *)queryForParameter:(nullable NSDictionary *)parameter {
    
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for(NSString *key in [parameter allKeys]) {
        NSString *value = [parameter objectForKey:key];
        
        NSString *operator = ([mutableString length]==0)?(@"?"):(@"&");
        [mutableString appendFormat:@"%@%@=%@", operator, key, value];
    }
    
    return mutableString;
}

@end
