//
//  Owner.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

@interface Owner : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ownerIdentifier;
@property (nonatomic, strong) NSString *organizationsUrl;
@property (nonatomic, strong) NSString *receivedEventsUrl;
@property (nonatomic, strong) NSString *followingUrl;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *subscriptionsUrl;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *reposUrl;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, strong) NSString *eventsUrl;
@property (nonatomic, assign) BOOL siteAdmin;
@property (nonatomic, strong) NSString *starredUrl;
@property (nonatomic, strong) NSString *gistsUrl;
@property (nonatomic, strong) NSString *gravatarId;
@property (nonatomic, strong) NSString *followersUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
