//
//  SOMyQuestionsAPIService.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/9/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOMyQuestionsAPIService : NSObject
+(void)fetchMyQuestionswithCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;
@end
