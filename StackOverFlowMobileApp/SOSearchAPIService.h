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
+ (void)searchWithTerm:(NSString *)searchTerm pageNumber:(int)pageNumber withCompletion:(kNSDictionaryCompletionHandler)completion;
@end
