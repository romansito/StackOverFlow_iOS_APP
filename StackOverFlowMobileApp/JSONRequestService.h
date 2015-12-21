//
//  JSONRequestService.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface JSONRequestService : NSObject

+ (void)getRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary * _Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completion;

@end
