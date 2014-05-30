//
//  AIDetailViewController.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIDetailViewController.h"
#import "AIDetailDataSource.h"

static NSString * const titleKey = @"title";

@interface AIDetailViewController ()
@property (nonatomic,strong) NSDictionary *idea;
@property (nonatomic, strong) AIDetailDataSource *dataSource;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation AIDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // I wanted to just assign, but I need to CREATE one
        self.dataSource = [AIDetailDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set Title with text in indexPath of the ideasArray
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self.dataSource;
    tableView.rowHeight = 150;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    [self.dataSource registerTableView:tableView];
    
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newVoice)];
    self.navigationItem.rightBarButtonItem = plusButton;
    
}
- (void) newVoice{
    [self.dataSource newVoice];
    [self.tableView reloadData];
}
// executed when row is selected on previous view
- (void) updateWithIdea:(NSDictionary *)idea{
    self.idea = idea;
    // What does this do exactly?
    self.dataSource.idea = idea;
    self.title = [idea objectForKey:titleKey];
}
@end
