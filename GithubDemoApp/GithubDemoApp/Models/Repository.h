//
//  Repository.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

#import <Foundation/Foundation.h>
#import "Owner.h"

@class Owner;

@interface Repository : NSObject

@property (nonatomic, strong) Owner *owner;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger openIssuesCount;
@property (nonatomic, assign) NSInteger forksCount;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, assign) NSInteger stargazersCount;
@property (nonatomic, strong) NSString *language;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
