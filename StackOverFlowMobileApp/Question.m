//
//  Question.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id)initWithTitle:(NSString *)title owner:(User *)owner isAnswered:(BOOL)isAnswered score:(int)score creationDate:(int)creationDate questionID:(int)questionID link:(NSURL *)link
{
	if (self = [super init]) {
		[self setTitle:title];
		[self setOwner:owner];
		[self setIsAnswered:isAnswered];
		[self setScore:score];
		[self setCreationDate:creationDate];
		[self setQuestionID:questionID];
		[self setLink:link];
	}
	
	return self;
}

@end
