//
//  NetworkManager.m
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "Repository.h"

@implementation NetworkManager: NSObject

+(void) getRepositoriesWithCompletion: (void(^)(NSArray<Repository*>* list)) completion {
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
                                                    NSArray * jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];;

                                                    NSMutableArray *parsedList = [NSMutableArray array];
                                                    for (NSDictionary *item in jsonArray) {
                                                        if ([item isKindOfClass:[NSDictionary class]]) {
                                                            [parsedList addObject:[Repository modelObjectWithDictionary:item]];
                                                        }
                                                   }
                                                    completion(parsedList);
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    [task resume];
}

+(void) getRepositoryDateFromUrl:(NSString*) urlString completion: (void(^)(NSString* dateString)) completion {

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
                                                    NSError *jsonError = nil;
                                                    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                                                    NSString* dateString = [json valueForKey:@"created_at"];
                                                    completion(dateString);
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    [task resume];
}

+(void) getRepositoryDetailsFromUrl:(NSString*) urlString completion: (void(^)(Repository* repository)) completion {
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
                                                    NSError *jsonError = nil;
                                                    NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];;

                                                    Repository *repository = [Repository modelObjectWithDictionary:jsonDict];
                                                    completion(repository);
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    [task resume];
}

@end
