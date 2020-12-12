//
//  Repository.m
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

#import <Foundation/Foundation.h>

#import "Repository.h"
#import "Owner.h"



NSString *const kRepositoryKeysUrl = @"keys_url";
NSString *const kRepositoryStatusesUrl = @"statuses_url";
NSString *const kRepositoryIssuesUrl = @"issues_url";
NSString *const kRepositoryDefaultBranch = @"default_branch";
NSString *const kRepositoryIssueEventsUrl = @"issue_events_url";
NSString *const kRepositoryId = @"id";
NSString *const kRepositoryOwner = @"owner";
NSString *const kRepositoryEventsUrl = @"events_url";
NSString *const kRepositorySubscriptionUrl = @"subscription_url";
NSString *const kRepositoryWatchers = @"watchers";
NSString *const kRepositoryGitCommitsUrl = @"git_commits_url";
NSString *const kRepositorySubscribersUrl = @"subscribers_url";
NSString *const kRepositoryCloneUrl = @"clone_url";
NSString *const kRepositoryHasWiki = @"has_wiki";
NSString *const kRepositoryPullsUrl = @"pulls_url";
NSString *const kRepositoryUrl = @"url";
NSString *const kRepositoryFork = @"fork";
NSString *const kRepositoryNotificationsUrl = @"notifications_url";
NSString *const kRepositoryDescription = @"description";
NSString *const kRepositoryCollaboratorsUrl = @"collaborators_url";
NSString *const kRepositoryDeploymentsUrl = @"deployments_url";
NSString *const kRepositoryLanguagesUrl = @"languages_url";
NSString *const kRepositoryHasIssues = @"has_issues";
NSString *const kRepositoryCommentsUrl = @"comments_url";
NSString *const kRepositoryPrivate = @"private";
NSString *const kRepositorySize = @"size";
NSString *const kRepositoryGitTagsUrl = @"git_tags_url";
NSString *const kRepositoryUpdatedAt = @"updated_at";
NSString *const kRepositorySshUrl = @"ssh_url";
NSString *const kRepositoryName = @"name";
NSString *const kRepositoryArchiveUrl = @"archive_url";
NSString *const kRepositoryOpenIssuesCount = @"open_issues_count";
NSString *const kRepositoryBlobsUrl = @"blobs_url";
NSString *const kRepositoryContributorsUrl = @"contributors_url";
NSString *const kRepositoryMilestonesUrl = @"milestones_url";
NSString *const kRepositoryContentsUrl = @"contents_url";
NSString *const kRepositoryForksCount = @"forks_count";
NSString *const kRepositoryTreesUrl = @"trees_url";
NSString *const kRepositoryMirrorUrl = @"mirror_url";
NSString *const kRepositoryHasDownloads = @"has_downloads";
NSString *const kRepositoryCreatedAt = @"created_at";
NSString *const kRepositoryForksUrl = @"forks_url";
NSString *const kRepositorySvnUrl = @"svn_url";
NSString *const kRepositoryCommitsUrl = @"commits_url";
NSString *const kRepositoryHomepage = @"homepage";
NSString *const kRepositoryTeamsUrl = @"teams_url";
NSString *const kRepositoryBranchesUrl = @"branches_url";
NSString *const kRepositoryIssueCommentUrl = @"issue_comment_url";
NSString *const kRepositoryMergesUrl = @"merges_url";
NSString *const kRepositoryGitRefsUrl = @"git_refs_url";
NSString *const kRepositoryGitUrl = @"git_url";
NSString *const kRepositoryForks = @"forks";
NSString *const kRepositoryOpenIssues = @"open_issues";
NSString *const kRepositoryHooksUrl = @"hooks_url";
NSString *const kRepositoryHtmlUrl = @"html_url";
NSString *const kRepositoryReleasesUrl = @"releases_url";
NSString *const kRepositoryAssigneesUrl = @"assignees_url";
NSString *const kRepositoryStargazersUrl = @"stargazers_url";
NSString *const kRepositoryStargazersCount = @"stargazers_count";
NSString *const kRepositoryHasPages = @"has_pages";
NSString *const kRepositoryCompareUrl = @"compare_url";
NSString *const kRepositoryTagsUrl = @"tags_url";
NSString *const kRepositoryWatchersCount = @"watchers_count";
NSString *const kRepositoryFullName = @"full_name";
NSString *const kRepositoryLanguage = @"language";
NSString *const kRepositoryPushedAt = @"pushed_at";
NSString *const kRepositoryLabelsUrl = @"labels_url";
NSString *const kRepositoryDownloadsUrl = @"downloads_url";


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
