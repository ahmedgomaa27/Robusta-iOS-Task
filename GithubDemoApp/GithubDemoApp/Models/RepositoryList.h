//
//  RepositoryList.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>

@class RepositoryListElement;
@class Owner;

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<RepositoryListElement *> RepositoryList;

#pragma mark - Top-level marshaling functions

RepositoryList *_Nullable RepositoryListFromData(NSData *data, NSError **error);
RepositoryList *_Nullable RepositoryListFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData          *_Nullable RepositoryListToData(RepositoryList *repositoryList, NSError **error);
NSString        *_Nullable RepositoryListToJSON(RepositoryList *repositoryList, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface RepositoryListElement : NSObject
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, copy)           NSString *nodeID;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, copy)           NSString *fullName;
@property (nonatomic, assign)         BOOL isPrivate;
@property (nonatomic, strong)         Owner *owner;
@property (nonatomic, copy)           NSString *htmlURL;
@property (nonatomic, nullable, copy) NSString *theDescription;
@property (nonatomic, assign)         BOOL isFork;
@property (nonatomic, copy)           NSString *url;
@property (nonatomic, copy)           NSString *forksURL;
@property (nonatomic, copy)           NSString *keysURL;
@property (nonatomic, copy)           NSString *collaboratorsURL;
@property (nonatomic, copy)           NSString *teamsURL;
@property (nonatomic, copy)           NSString *hooksURL;
@property (nonatomic, copy)           NSString *issueEventsURL;
@property (nonatomic, copy)           NSString *eventsURL;
@property (nonatomic, copy)           NSString *assigneesURL;
@property (nonatomic, copy)           NSString *branchesURL;
@property (nonatomic, copy)           NSString *tagsURL;
@property (nonatomic, copy)           NSString *blobsURL;
@property (nonatomic, copy)           NSString *gitTagsURL;
@property (nonatomic, copy)           NSString *gitRefsURL;
@property (nonatomic, copy)           NSString *treesURL;
@property (nonatomic, copy)           NSString *statusesURL;
@property (nonatomic, copy)           NSString *languagesURL;
@property (nonatomic, copy)           NSString *stargazersURL;
@property (nonatomic, copy)           NSString *contributorsURL;
@property (nonatomic, copy)           NSString *subscribersURL;
@property (nonatomic, copy)           NSString *subscriptionURL;
@property (nonatomic, copy)           NSString *commitsURL;
@property (nonatomic, copy)           NSString *gitCommitsURL;
@property (nonatomic, copy)           NSString *commentsURL;
@property (nonatomic, copy)           NSString *issueCommentURL;
@property (nonatomic, copy)           NSString *contentsURL;
@property (nonatomic, copy)           NSString *compareURL;
@property (nonatomic, copy)           NSString *mergesURL;
@property (nonatomic, copy)           NSString *archiveURL;
@property (nonatomic, copy)           NSString *downloadsURL;
@property (nonatomic, copy)           NSString *issuesURL;
@property (nonatomic, copy)           NSString *pullsURL;
@property (nonatomic, copy)           NSString *milestonesURL;
@property (nonatomic, copy)           NSString *notificationsURL;
@property (nonatomic, copy)           NSString *labelsURL;
@property (nonatomic, copy)           NSString *releasesURL;
@property (nonatomic, copy)           NSString *deploymentsURL;
@end

@interface Owner : NSObject
@property (nonatomic, copy)   NSString *login;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *nodeID;
@property (nonatomic, copy)   NSString *avatarURL;
@property (nonatomic, copy)   NSString *gravatarID;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, copy)   NSString *htmlURL;
@property (nonatomic, copy)   NSString *followersURL;
@property (nonatomic, copy)   NSString *followingURL;
@property (nonatomic, copy)   NSString *gistsURL;
@property (nonatomic, copy)   NSString *starredURL;
@property (nonatomic, copy)   NSString *subscriptionsURL;
@property (nonatomic, copy)   NSString *organizationsURL;
@property (nonatomic, copy)   NSString *reposURL;
@property (nonatomic, copy)   NSString *eventsURL;
@property (nonatomic, copy)   NSString *receivedEventsURL;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, assign) BOOL isSiteAdmin;
@end

NS_ASSUME_NONNULL_END
