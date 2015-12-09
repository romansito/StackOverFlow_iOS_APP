//
//  JSONRequestService.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "JSONRequestService.h"
#import "AFNetworking.h"

@implementation JSONRequestService
+ (void)getRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameters withCompletion:(kNSDataCompletionHandler)completion {
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	[manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
		NSData *data = (NSData *)responseObject;
		completion(data, nil);
	} failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
		completion(nil, error);
	}];
}

@end
