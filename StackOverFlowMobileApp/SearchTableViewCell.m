//
//  SearchTableViewCell.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/8/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "Question.h"
#import "ImageFetchService.h"


@interface SearchTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *userName;



@end


@implementation SearchTableViewCell

-(void)setQuestion:(Question *)question {
	_question = question;
	
	// ..
	[self setupQuestion:question];
}

- (void)setupQuestion:(Question *)question
{
	if (question.owner){
		NSLog(@"we have an owner");
		NSLog(@"owners name: %@", self.question.owner.display_name);
		
		[self.titleLabel setText:question.title];
		if (self.question.owner.display_name){
			[self.userName setText:self.question.owner.display_name];
		}
		
		if (self.question.owner.imageProfile) {
			[self.imgView setImage:question.owner.imageProfile];
		} else {
			
			//
			NSURL *profileImgUrl;
			NSLog(@"hurray %@" ,profileImgUrl.description);
			[ImageFetchService fetchImageWithURL:question.owner.profile_image completionHandler:^(UIImage * _Nullable data, NSError * _Nullable error) {
				if (error == nil) {
					
					if ([[NSThread currentThread]isMainThread]) {
						//
					}
					
					NSLog(@"Image was fetched!");
					[self.question.owner setImageProfile:data];
					[self.imgView setImage:data];
				} else {
				}
			}];
		}
	}
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
}

@end
