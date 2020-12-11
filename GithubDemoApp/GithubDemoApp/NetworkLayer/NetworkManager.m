//
//  NetworkManager.m
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "RepositoryList.h"

@implementation NetworkManager: NSObject

+(void) getRepositoriesWithCompletion: (void(^)(RepositoryList* list)) completion {
    NSString *urlString = @"https://api.github.com/repositories";

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                  delegate:nil
                             delegateQueue:[NSOperationQueue mainQueue]];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
                                                if (!error) {
                                                    //TODO: need fix here
                                                    NSError *jsonError = nil;
                                                    NSString * jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                       RepositoryList *repositoryList = RepositoryListFromJSON(jsonString, NSUTF8StringEncoding, &jsonError);
                                                    completion(repositoryList);
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    [task resume];
}

@end
