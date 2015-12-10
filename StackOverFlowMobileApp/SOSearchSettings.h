//
//  SOSearchSettings.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/9/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	Activity,
	Votes,
	Creation,
	Relevance
} Sort ;

typedef enum {
	Decending,
	Ascending
} Order;

@interface SOSearchSettings : NSObject

@property Sort sort;
@property Order order;

+(SOSearchSettings * _Nonnull) sharedService;

-(NSString *) getSortParameterForUrl;
-(NSString *) getOrderParameterForUrl;


@end
