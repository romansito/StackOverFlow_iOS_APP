//
//  MenuViewController.m
//  StackOverFlowMobileApp
//
//  Created by Roman Salazar Lopez on 12/7/15.
//  Copyright © 2015 Roman Salazar Lopez. All rights reserved.
//

#import "ContainerViewController.h"
#import "MenuTableViewController.h"
#import "SearchQuestionsViewController.h"
#import "MyQuestionsViewController.h"
#import "ProfileViewController.h"

CGFloat const kBurgerOpenScreenDivider = 3.0;
CGFloat const kBurgerOpenScreenMultiplier = 2.0;
CGFloat const kBurgerButtonWidth = 50.0;
CGFloat const kBurgerButtonHeight = 50.0;

NSTimeInterval const kTimeToSlideMenuOpen = 0.2;

@interface ContainerViewController ()<UITableViewDelegate>

@property (strong, nonatomic) MenuTableViewController *menuTableView;
@property (strong, nonatomic) SearchQuestionsViewController *searchQuestionsViewController;
@property (strong, nonatomic) MyQuestionsViewController *myQuestionsViewController;
@property (strong, nonatomic) ProfileViewController *profileViewController;
@property (strong, nonatomic) UIButton *burgerButton;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (strong,nonatomic) NSArray *viewControllers;


@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupAllViewControllers];
	[self setupBurgerButton];
	[self setupPanGesture];
}

-(BOOL)prefersStatusBarHidden{
	return true;
}

- (void)setupAllViewControllers
{
	[self setupMenuTableViewController];
	[self setupContentViewController];
	
	self.viewControllers = @[self.searchQuestionsViewController, self.myQuestionsViewController, self.profileViewController];
}

- (void)setupMenuTableViewController
{
	MenuTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tableViewController"];
	tableViewController.tableView.delegate = self;
	
	[self addChildViewController:tableViewController];
	tableViewController.view.frame = self.view.frame;
	
	[self.view addSubview:tableViewController.view];
	[tableViewController didMoveToParentViewController:self];
	self.menuTableView = tableViewController;
}

- (void)setupContentViewController
{
	// Search Questions View Controller
	SearchQuestionsViewController *searchQuestionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchViewController"];
	
	[self addChildViewController:searchQuestionsVC];
	searchQuestionsVC.view.frame = self.view.frame;
	
	[self.view addSubview:searchQuestionsVC.view];
	[searchQuestionsVC didMoveToParentViewController:self];
	self.searchQuestionsViewController = searchQuestionsVC;
	
	// My Questions View Controller
	MyQuestionsViewController *myQuestionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"myQuestionViewController"];
	
	[self addChildViewController:myQuestionsVC];
	myQuestionsVC.view.frame = self.view.frame;
	
	[self.view addSubview:myQuestionsVC.view];
	[myQuestionsVC didMoveToParentViewController:self];
	self.myQuestionsViewController = myQuestionsVC;
	
	// Profile View Controller
	ProfileViewController *profileVC = [self.storyboard
		instantiateViewControllerWithIdentifier:@"profileViewController"];
	
	[self addChildViewController:profileVC];
	profileVC.view.frame = self.view.frame;
	
	[self.view addSubview:profileVC.view];
	[profileVC didMoveToParentViewController:self];
	self.profileViewController = profileVC;
	
}

#pragma MARK - Set up Burger Button

- (void)setupBurgerButton
{
	UIButton *burgerButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, kBurgerButtonWidth, kBurgerButtonHeight)];
	[burgerButton setImage:[UIImage imageNamed:@"burgerMenu" ] forState:UIControlStateNormal];
	[self.searchQuestionsViewController.view addSubview:burgerButton];
	[burgerButton addTarget:self action:@selector(burgerButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
	self.burgerButton = burgerButton;
}

- (void)burgerButtonSelected:(UIButton *)sender
{
	[UIView animateWithDuration:kTimeToSlideMenuOpen animations:^{
		self.searchQuestionsViewController.view.center = CGPointMake(self.view.center.x * kBurgerOpenScreenMultiplier, self.view.center.y);
	} completion:^(BOOL finished) {
		
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(burgerButtonDeselected:)];
		[self.searchQuestionsViewController.view addGestureRecognizer:tap];
		sender.userInteractionEnabled = false;
	}];
}

-(void)burgerButtonDeselected:(UITapGestureRecognizer *)tap
{
	[self.searchQuestionsViewController.view removeGestureRecognizer:tap];
	[UIView animateWithDuration:0.3 animations:^{
		self.searchQuestionsViewController.view.center = self.view.center;
	} completion:^(BOOL finished) {
		self.burgerButton.userInteractionEnabled = true;
	}];
}

#pragma MARK - setupPanGesture

-(void)setupPanGesture
{
	UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(searchQuestionsViewControllerPanned:)];
	[self.searchQuestionsViewController.view addGestureRecognizer:pan];
	self.panGesture = pan;
}

#pragma MARK - ViewControllerTransitions
- (void)searchQuestionsViewControllerPanned:(UIPanGestureRecognizer *)sender
{
	CGPoint velocity = [sender velocityInView:self.searchQuestionsViewController	.view];
	CGPoint translation = [sender translationInView:self.searchQuestionsViewController.view];
	
	if (sender.state == UIGestureRecognizerStateChanged) {
		if (velocity.x > 0) {
			self.searchQuestionsViewController.view.center = CGPointMake(self.searchQuestionsViewController.view.center.x + translation.x, self.searchQuestionsViewController.view.center.y);
			[sender setTranslation:CGPointZero inView:self.searchQuestionsViewController.view];
		}
	}
	
	if (sender.state == UIGestureRecognizerStateEnded) {
		if (self.searchQuestionsViewController.view.frame.origin.x > self.searchQuestionsViewController.view.frame.size.width / kBurgerOpenScreenDivider) {
			NSLog(@"user is opening menu");
			
			[UIView animateWithDuration:kTimeToSlideMenuOpen animations:^{
				self.searchQuestionsViewController.view.center = CGPointMake(self.view.center.x * kBurgerOpenScreenMultiplier, self.searchQuestionsViewController.view.center.y);
			} completion:^(BOOL finished) {
				
				UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(burgerButtonDeselected:)];
				[self.searchQuestionsViewController.view addGestureRecognizer:tap];
				self.burgerButton.userInteractionEnabled = false;
				
			}];
		} else {
			[UIView animateWithDuration:kTimeToSlideMenuOpen animations:^{
				self.searchQuestionsViewController.view.center = CGPointMake(self.view.center.x, self.searchQuestionsViewController.view.center.y);
			} completion:^(BOOL finished) {
				
			}];
		}
	}

}


- (void)switchViewControllers:(UIViewController *)viewController
{
	[UIView animateWithDuration:kTimeToSlideMenuOpen animations:^{
		self.searchQuestionsViewController.view.frame = CGRectMake(self.view.frame.size.width, self.searchQuestionsViewController.view.frame.origin.y, self.searchQuestionsViewController.view.frame.size.width, self.searchQuestionsViewController.view.frame.size.height);
	} completion:^(BOOL finished) {
		CGRect oldFrame = self.searchQuestionsViewController.view.frame;
		[self.searchQuestionsViewController willMoveToParentViewController:nil];
		[self.searchQuestionsViewController.view removeFromSuperview];
		[self.searchQuestionsViewController removeFromParentViewController];
		
		[self addChildViewController:viewController];
		viewController.view.frame = oldFrame;
		[self.view addSubview:viewController.view];
		[viewController didMoveToParentViewController:self];
		self.searchQuestionsViewController = viewController;
		
		[self.burgerButton removeFromSuperview];
		[self.searchQuestionsViewController.view addSubview:self.burgerButton];
		
		[UIView animateWithDuration:kTimeToSlideMenuOpen animations:^{
			self.searchQuestionsViewController.view.center = self.view.center;
		} completion:^(BOOL finished) {
			[self.searchQuestionsViewController.view addGestureRecognizer:self.panGesture];
			self.burgerButton.userInteractionEnabled = true;
		}];
		
	}];
}

#pragma MARK - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Selected Menu Item:%ld",(long)indexPath.row);
	
	UIViewController *viewController = self.viewControllers[indexPath.row];
	if (![viewController isEqual:self.searchQuestionsViewController]) {
		[self switchViewControllers:viewController];
	}
}











































@end
