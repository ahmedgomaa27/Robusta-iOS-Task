//
//  NetworkProtocol.h
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 12/12/2020.
//
#import <Foundation/Foundation.h>
#import "Repository.h"

@protocol NetworkProtocol<NSObject>
-(void) getRepositoriesWithName:(NSString*) name completion: (void(^)(NSArray<Repository*>* list)) completion;
@end
