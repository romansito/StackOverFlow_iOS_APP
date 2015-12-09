//
//  SOSearchAPIService.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "SOSearchAPIService.h"
#import "JSONRequestService.h"


@implementation SOSearchAPIService

+ (void)searchWithTerm:(NSString *)searchTerm pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler)completion
{
	NSString *searchAPIURL = @"https://api.stackexchange.com/2.2/search";
	NSString *pageNumber;
	if (pageNumber > 0) {
		pageNumber = [NSString stringWithFormat:@"%d",pageNumberParam];
	} else {
		pageNumber = @"1";
	}
	
	NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
	[parameters setObject:searchTerm forKey:@"intitle"];
	[parameters setObject:pageNumber forKey:@"page"];
	[parameters setObject:@"stackoverflow" forKey:@"site"];

	[JSONRequestService getRequestWithURL:searchAPIURL parameters:parameters withCompletion:^(NSData * _Nullable data, NSError * _Nullable error) {
		if (error != nil) {
			completion(nil, error);
			return;
		}
		
		NSDictionary *result = (NSDictionary *) data;
		completion(result,nil);
		return;
	}];

}

@end
