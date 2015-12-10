//
//  SOSearchAPIService.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOSearchAPIService : NSObject
+(void )searchWithTearm:(NSString * _Nonnull)searchTermParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

+(void) searchWithTearm:(NSString * _Nonnull)searchTerm pageNumber:(int)pageNumber withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

+(void) searchSimilarWithTearm:(NSString * _Nonnull)searchTermParam pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

@end
