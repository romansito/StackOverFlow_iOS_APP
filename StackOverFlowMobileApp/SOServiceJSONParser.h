//
//  SOServiceJSONParser.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOServiceJSONParser : NSObject

+(void)questionsArrayFromDictionary:(NSDictionary *)dictionary completionHandler:(kNSArrayCompletionHandler)completion;

@end
