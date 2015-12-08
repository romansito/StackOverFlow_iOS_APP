//
//  OAuthWebViewController.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/7/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "OAuthWebViewController.h"
@import WebKit;

NSString const *kClientID = @"6117";
NSString const *kBaseURL = @"https://stackexchange.com/oauth/dialog?";
NSString const *kRedirectURI = @"https://stackexchange.com/oauth/login_success";

@interface OAuthWebViewController () <WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation OAuthWebViewController

// Do any addiitional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
	[self.view addSubview:self.webView];
	
	self.webView.navigationDelegate = self;
	
	NSString *stackURLString = [NSString stringWithFormat:@"%@client_id=%@&redirect_uri=%@", kBaseURL, kClientID, kRedirectURI];
	NSURL *stackURL = [NSURL URLWithString:stackURLString];
	
	[self.webView loadRequest:[NSURLRequest requestWithURL:stackURL]];
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
	
	NSURLRequest *request = navigationAction.request;
	NSURL *requestURL = request.URL;
	
	if([requestURL.description containsString:@"access_token"]){
		NSArray *urlComponents = [[requestURL description] componentsSeparatedByString:@"="];
		NSString *accessToken = urlComponents.lastObject;
		NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
		[userDefaults setObject:accessToken forKey:@"accessToken"];
		[userDefaults synchronize];
		
		if (self.completion) {
			self.completion();
		}
	}
	
	decisionHandler(WKNavigationActionPolicyAllow);
}


@end
