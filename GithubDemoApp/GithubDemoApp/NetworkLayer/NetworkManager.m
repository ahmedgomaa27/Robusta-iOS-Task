//
//  NetworkManager.m
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "Repository.h"


NSString *const baseUrl = @"https://api.github.com/";
NSString *const searchPath = @"search/repositories?q=";

@implementation NetworkManager: NSObject

-(void) getRepositoriesWithName:(NSString*) name completion: (void(^)(NSArray<Repository*>* list)) completion {
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@%@", baseUrl, searchPath, name];

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
                                                    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                                                    NSArray* items = [response valueForKey:@"items"];;

                                                    NSMutableArray *parsedList = [NSMutableArray array];
                                                    for (NSDictionary *item in items) {
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

@end
