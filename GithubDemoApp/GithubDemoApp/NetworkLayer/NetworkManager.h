//
//  NetworkManager.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>
#import "RepositoryList.h"
#ifndef NetworkManager_h
#define NetworkManager_h

@interface NetworkManager : NSObject
+(void) getRepositoriesWithCompletion: (void(^)(RepositoryList*)) completion;
@end
#endif /* NetworkManager_h */
