//
//  MyQuestionsViewController.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/7/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "MyQuestionsViewController.h"
#import "Question.h"
#import "SearchTableViewCell.h"
#import "SOMyQuestionsAPIService.h"
#import "ImageFetchService.h"
#import "SOMyQuestionsAPIService.h"

@interface MyQuestionsViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<MyQuestionsViewController*> *myQuestions;

@end

@implementation MyQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupTableView
{
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.searchBar.delegate = self;
	[self setupNib];
}
- (void)setupNib
{
	UINib *nib = [UINib nibWithNibName:@"SearchResultTableViewCell" bundle:nil];
	[[self tableView] registerNib:nib forCellReuseIdentifier:@"SearchResultTableViewCell"];
}
- (void)setupFetchedMyQuestions:(NSString*)searchTerm
{
	//
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//
}
@end
