//
//  NetworkManager.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@interface NetworkManager : NSObject
+(void) getRepositoriesWithCompletion: (void(^)(NSArray<Repository*>* list)) completion;
+(void) getRepositoryDateFromUrl:(NSString*) urlString completion: (void(^)(NSString* dateString)) completion;
@end
