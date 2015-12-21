//
//  Question.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

//"is_answered": true,
//"view_count": 10,
//"answer_count": 1,
//"score": 0,
//"last_activity_date": 1449613152,
//"creation_date": 1449611285,
//"last_edit_date": 1449612958,
//"question_id": 34166651,
//"link": "http://stackoverflow.com/questions/34166651/83-5x83-52x-app-icon-is-required-for-ipad-apps-targeting-ios-9-0-and-later",
//"title": "83.5x83.5@2x app icon is required for iPad apps targeting iOS 9.0 and later"

@interface Question : NSObject

@property NSString *title;
@property (strong,nonatomic) User *owner;
@property BOOL isAnswered;
@property int score;
@property int creationDate;
@property int questionID;
@property NSURL *link;

- (id)initWithTitle:(NSString *)title
			  owner:(User *)owner
			  isAnswered:(BOOL)isAnswered
			  score:(int)score
	   creationDate:(int)creationDate
		 questionID:(int)questionID
			   link:(NSURL *)link;

@end
