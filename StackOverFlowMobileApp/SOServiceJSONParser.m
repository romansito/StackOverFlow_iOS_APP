//
//  SOServiceJSONParser.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "SOServiceJSONParser.h"
#import "Question.h"
#import "User.h"

@implementation SOServiceJSONParser
+(void)questionsArrayFromDictionary:(NSDictionary *)dictionary completionHandler:(kNSArrayCompletionHandler)completion {
	
	NSMutableArray *result = [[NSMutableArray<Question *> alloc] init];
	
	if (dictionary) {
		NSMutableArray *items = dictionary[@"items"];
		if (items) {
			for (NSDictionary *item in items) {
				User *owner;
				if (item) {
					NSDictionary *ownerDictionary = item[@"owner"];
					if (ownerDictionary) {
						NSString *displayName = ownerDictionary[@"display_name"];
						NSString *profileImageURLString = ownerDictionary[@"profile_image"];
						NSString *linkURLString = ownerDictionary[@"link"];
						int reputation = (int) ownerDictionary[@"reputation"];
						int userID = (int) ownerDictionary[@"user_id"];
						
						NSURL *profileImageURL = [[NSURL alloc] initWithString:profileImageURLString];
						
						NSURL *link = [[NSURL alloc] initWithString:linkURLString];
						
						owner = [[User alloc] initWithDisplayName:displayName profileImageURL:profileImageURL link:link reputation:reputation user_id:userID];
						
					}
					
					NSString *title = item[@"title"];
					NSString *owner = item[@"owner"];
					int questionID = (int) item[@"question_id"];
					int score = (int) item[@"score"];
					BOOL isAnswered = (BOOL) item[@"is_answered"];
					int creationDate = (int) item[@"creation_date"];
					NSURL *link = (item)[@"link"];
					
					Question *question = [[Question alloc] initWithTitle:title owner:owner isAnswered:isAnswered score:score creationDate:creationDate questionID:questionID link:link];
										  
					
					if (question != nil) {
						[result addObject:question];
					}
					
				}
			}
			
			if (result != nil) {
				NSLog(@"paresd json: %@", result.description);
				completion(result, nil);
				return;
			}
			
		}
	}
	
	NSError *error = [NSError errorWithDomain:@"ERROR: failed to complet requset to SO 2.2/search" code:-1 userInfo:nil];
	
	completion(nil, error);
	
}



@end
