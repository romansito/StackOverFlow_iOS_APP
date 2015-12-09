//
//  User.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithDisplayName:(NSString*)display_name profileImageURL:(NSURL*)profile_image link:(NSURL*)link reputation:(int)reputation user_id:(int)user_id
{
	if (self = [super init]) {
		[self setDisplay_name:display_name];
		[self setProfile_image:profile_image];
		[self setLink:link];
		[self setReputation:reputation];
		[self setUser_id:user_id];
	}
	
	return self;
}

@end
