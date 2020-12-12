//
//  NetworkManager.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@interface NetworkManager : NSObject
-(void) getRepositoriesWithName:(NSString*) name completion: (void(^)(NSArray<Repository*>* list)) completion;
@end
