//
//  Owner.m
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

#import <Foundation/Foundation.h>
#import "Owner.h"

NSString *const kOwnerId = @"id";
NSString *const kOwnerOrganizationsUrl = @"organizations_url";
NSString *const kOwnerReceivedEventsUrl = @"received_events_url";
NSString *const kOwnerFollowingUrl = @"following_url";
NSString *const kOwnerLogin = @"login";
NSString *const kOwnerSubscriptionsUrl = @"subscriptions_url";
NSString *const kOwnerAvatarUrl = @"avatar_url";
NSString *const kOwnerUrl = @"url";
NSString *const kOwnerType = @"type";
NSString *const kOwnerReposUrl = @"repos_url";
NSString *const kOwnerHtmlUrl = @"html_url";
NSString *const kOwnerEventsUrl = @"events_url";
NSString *const kOwnerSiteAdmin = @"site_admin";
NSString *const kOwnerStarredUrl = @"starred_url";
NSString *const kOwnerGistsUrl = @"gists_url";
NSString *const kOwnerGravatarId = @"gravatar_id";
NSString *const kOwnerFollowersUrl = @"followers_url";


@interface Owner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Owner

@synthesize ownerIdentifier = _ownerIdentifier;
@synthesize organizationsUrl = _organizationsUrl;
@synthesize receivedEventsUrl = _receivedEventsUrl;
@synthesize followingUrl = _followingUrl;
@synthesize login = _login;
@synthesize subscriptionsUrl = _subscriptionsUrl;
@synthesize avatarUrl = _avatarUrl;
@synthesize url = _url;
@synthesize type = _type;
@synthesize reposUrl = _reposUrl;
@synthesize htmlUrl = _htmlUrl;
@synthesize eventsUrl = _eventsUrl;
@synthesize siteAdmin = _siteAdmin;
@synthesize starredUrl = _starredUrl;
@synthesize gistsUrl = _gistsUrl;
@synthesize gravatarId = _gravatarId;
@synthesize followersUrl = _followersUrl;


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
            self.ownerIdentifier = [[self objectOrNilForKey:kOwnerId fromDictionary:dict] doubleValue];
            self.organizationsUrl = [self objectOrNilForKey:kOwnerOrganizationsUrl fromDictionary:dict];
            self.receivedEventsUrl = [self objectOrNilForKey:kOwnerReceivedEventsUrl fromDictionary:dict];
            self.followingUrl = [self objectOrNilForKey:kOwnerFollowingUrl fromDictionary:dict];
            self.login = [self objectOrNilForKey:kOwnerLogin fromDictionary:dict];
            self.subscriptionsUrl = [self objectOrNilForKey:kOwnerSubscriptionsUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kOwnerAvatarUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kOwnerUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kOwnerType fromDictionary:dict];
            self.reposUrl = [self objectOrNilForKey:kOwnerReposUrl fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kOwnerHtmlUrl fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:kOwnerEventsUrl fromDictionary:dict];
            self.siteAdmin = [[self objectOrNilForKey:kOwnerSiteAdmin fromDictionary:dict] boolValue];
            self.starredUrl = [self objectOrNilForKey:kOwnerStarredUrl fromDictionary:dict];
            self.gistsUrl = [self objectOrNilForKey:kOwnerGistsUrl fromDictionary:dict];
            self.gravatarId = [self objectOrNilForKey:kOwnerGravatarId fromDictionary:dict];
            self.followersUrl = [self objectOrNilForKey:kOwnerFollowersUrl fromDictionary:dict];

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
