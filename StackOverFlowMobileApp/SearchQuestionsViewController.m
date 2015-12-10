//
//  SearchQuestionsViewController.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/7/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "SearchQuestionsViewController.h"
#import "SOSearchAPIService.h"
#import "SOServiceJSONParser.h"
#import "Question.h"
#import "SearchTableViewCell.h"
#import "SOSearchSettings.h"

@interface SearchQuestionsViewController ()<UISearchBarDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSArray<Question*> *Questions;

@end

@implementation SearchQuestionsViewController

-(void)setQuestions:(NSArray<Question *> *)Questions{
	_Questions = Questions;
	[self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupNibCell];
	
	[self.tableView setDelegate:self];
	[self.tableView setDataSource:self];
	[self.searchBar setDelegate:self];
	[self fetchResultsForSearchTearm:@"ios"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupQuestions:(NSArray *)Questions
{
	_Questions = Questions;
	[self.tableView reloadData];
}

- (void)setupNibCell
{
	UINib *nib = [UINib nibWithNibName:@"SearchTableViewCell" bundle:nil];
	[[self tableView] registerNib:nib forCellReuseIdentifier:@"SearchResultCell"];
}



-(void) fetchResultsForSearchTearm:(NSString*)searchTerm {
	

	[SOSearchAPIService searchWithTearm:searchTerm pageNumber:0 withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
		if (error == nil){
			NSLog(@"Success Requesting SOSearchAPIService SOSearchAPIService*");
			[SOServiceJSONParser questionsArrayFromDictionary:data completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
				if (error == nil && data != nil) {
					NSLog(@"\n\nSuccess Parsing SearchGetRequest: %@\n",data.description);
					[self setQuestions:data];
					[self.tableView reloadData];
					return;
				}
				NSLog(@"Failure ParsingSOSearchJSONParser questionsArrayFromDictionary");
				NSLog(@"%@\n\n", error.description);
			}];
			return;
		}
		NSLog(@"Failure Requesting SOSearchAPIService SOSearchAPIService*\n\n");
		NSLog(@"%@\n\n", error.description);
		
	}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.Questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SearchTableViewCell *cell = (SearchTableViewCell *) [self.tableView dequeueReusableCellWithIdentifier:@"SearchResultCell"];
	cell.question = [self.Questions objectAtIndex:indexPath.row];
	return cell;
}




@end
