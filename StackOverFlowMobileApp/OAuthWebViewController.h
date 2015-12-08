//
//  OAuthWebViewController.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/7/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OAuthWebViewControllerComletion)();

@interface OAuthWebViewController : UIViewController
@property (copy, nonatomic) OAuthWebViewControllerComletion completion;
@end
