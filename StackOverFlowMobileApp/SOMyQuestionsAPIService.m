//
//  SOMyQuestionsAPIService.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/9/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "SOMyQuestionsAPIService.h"
#import "Constants.h"
#import "JSONRequestService.h"

@implementation SOMyQuestionsAPIService
+(void )fetchMyQuestionswithCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler{
	
	NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
	
	[parameters setObject:@"1" forKey:@"page"];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	NSString *accessToken = [defaults stringForKey:@"accessToken"];
	NSLog(@"accessToken: %@", accessToken);
	
//JSONRequestService getRequestWithURL: parameters:<#(NSDictionary * _Nullable)#> withCompletion:<#^(NSData * _Nullable data, NSError * _Nullable error)completion#>
//	[JSONRequestService getRequestWithURL: parameters:(NSDictionary*)parameters withCompletion:^(id _Nullable data, NSError * _Nullable error) {
//		
//		if (error !=nil) {
//			completionHandler(nil, error);
//			return ;
//		}
//		
//		if ([data isKindOfClass:[NSDictionary class]]) {
//			completionHandler((NSDictionary * ) data, nil);
//			return;
//		}
//		
//		NSError *dictionaryError = [NSError errorWithDomain:@"TYPE ERRsOR: Converting response object to Dictionary" code:-1 userInfo:nil];
//		completionHandler(nil, dictionaryError);
//	}];
//}
}

@end
