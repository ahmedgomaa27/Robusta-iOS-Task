//
//  Repository.m
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

#import <Foundation/Foundation.h>

#import "Repository.h"
#import "Owner.h"

NSString *const kRepositoryOwner = @"owner";
NSString *const kRepositoryUrl = @"url";
NSString *const kRepositoryDescription = @"description";
NSString *const kRepositoryName = @"name";
NSString *const kRepositoryOpenIssuesCount = @"open_issues_count";
NSString *const kRepositoryForksCount = @"forks_count";
NSString *const kRepositoryCreatedAt = @"created_at";
NSString *const kRepositoryHtmlUrl = @"html_url";
NSString *const kRepositoryStargazersCount = @"stargazers_count";
NSString *const kRepositoryWatchersCount = @"watchers_count";
NSString *const kRepositoryLanguage = @"language";


@interface Repository ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@class Repository;
@implementation Repository

@synthesize repositoryDescription = _repositoryDescription;
@synthesize name = _name;
@synthesize openIssuesCount = _openIssuesCount;
@synthesize forksCount = _forksCount;
@synthesize createdAt = _createdAt;
@synthesize htmlUrl = _htmlUrl;
@synthesize language = _language;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];

    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.owner = [Owner modelObjectWithDictionary:[dict objectForKey:kRepositoryOwner]];
            self.url = [self objectOrNilForKey:kRepositoryUrl fromDictionary:dict];
            self.repositoryDescription = [self objectOrNilForKey:kRepositoryDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRepositoryName fromDictionary:dict];
            self.openIssuesCount = [[self objectOrNilForKey:kRepositoryOpenIssuesCount fromDictionary:dict] doubleValue];
            self.forksCount = [[self objectOrNilForKey:kRepositoryForksCount fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kRepositoryCreatedAt fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kRepositoryHtmlUrl fromDictionary:dict];
            self.stargazersCount = [[self objectOrNilForKey:kRepositoryStargazersCount fromDictionary:dict] intValue];
            self.language = [self objectOrNilForKey:kRepositoryLanguage fromDictionary:dict];

    }

    return self;

}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
