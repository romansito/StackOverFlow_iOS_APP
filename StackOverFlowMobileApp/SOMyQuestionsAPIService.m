//
//  SOMyQuestionsAPIService.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/9/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "SOMyQuestionsAPIService.h"
#import "Constants.h"

@implementation SOMyQuestionsAPIService
+(void )fetchMyQuestionswithCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler{
	
	NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
	
	[parameters setObject:@"1" forKey:@"page"];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	NSString *accessToken = [defaults stringForKey:@"accessToken"];
	NSLog(@"accessToken: %@", accessToken);

	
}
@end
