//
//  SearchTableViewCell.h
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface SearchTableViewCell : UITableViewCell
@property (strong, nonatomic) Question *question;
@end
