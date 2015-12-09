//
//  Constants.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^kNSDataCompletionHandler)(NSData * _Nullable data , NSError  * _Nullable  error);

typedef void (^kNSDictionaryCompletionHandler)(NSDictionary * _Nullable data , NSError  * _Nullable  error);

typedef void (^kNSArrayCompletionHandler)(NSArray * _Nullable data , NSError  * _Nullable  error);

typedef void (^kNSImageCompletionHandler)(UIImage * _Nullable data , NSError  * _Nullable  error);

