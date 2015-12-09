//
//  User.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//	"owner": {
//	"reputation": 1354,
//	"user_id": 558352,
//	"user_type": "registered",
//	"accept_rate": 60,
//	"profile_image": "https://www.gravatar.com/avatar/c2613835153b5b5980d276e1423434c3?s=128&d=identicon&r=PG",
//	"display_name": "Brad Thomas",
//	"link": "http://stackoverflow.com/users/558352/brad-thomas"
//}

@interface User : NSObject

@property int reputation;
@property int user_id;
@property NSURL *profile_image;
@property NSString *display_name;
@property NSURL *link;

-(id)initWithDisplayName:(NSString*)display_name profileImageURL:(NSURL*)profile_image link:(NSURL*)link reputation:(int)reputation user_id:(int)user_id;

@end
