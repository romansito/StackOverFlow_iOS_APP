//
//  ImageFetchService.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "ImageFetchService.h"
#import "AFNetworking.h"

@implementation ImageFetchService
+ (void)fetchImageWithURL:(NSURL *)url completionHandler:(kNSImageCompletionHandler)completionHandler
{
	dispatch_queue_t imageQeue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
	dispatch_async(imageQeue, ^{
		NSError *error;
		NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
		
		UIImage *result = [[UIImage alloc]initWithData:data];
		dispatch_async(dispatch_get_main_queue(), ^{
			if (error == nil && data != nil) {
				completionHandler(result, nil);
				return ;
			}
			if (error == nil && data == nil) {
				NSError *error = [NSError errorWithDomain:@"Error: Image is not here boo!" code:-41 userInfo:nil];
				completionHandler(nil, error);
				return;
			}
			completionHandler(nil, error);
		});
	});
}
@end
