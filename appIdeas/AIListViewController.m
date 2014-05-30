//
//  AIRootViewController.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIListViewController.h"
#import "AIListDataSource.h"

#import "AIDetailViewController.h"

@interface AIListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) AIListDataSource *dataSource;

@end

@implementation AIListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Creates instance of Data Source and assigns it to the root view controller
        self.dataSource = [AIListDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"App Ideas";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Ideas"
                                   style:UIBarButtonItemStylePlain
                                   target:nil
                                   action:nil];
    
    [self.navigationItem setBackBarButtonItem:backButton];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    // if this 'registerTableView' isn't required, why do we seperate it out?
    [self.dataSource registerTableView:tableView];
    tableView.dataSource = self.dataSource;
    // worked after this point... why do we need to include these other tableView.delegate?
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(newIdea)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
    
}

- (void)newIdea {
    [self.dataSource newIdea];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    AIDetailViewController *detailController = [AIDetailViewController new];
    //Can we go over the structure of [self.dataSource ideas][indexPath.row] != self.dataSource.ideas[indexPath.row]?
    [detailController updateWithIdea:[self.dataSource ideas][indexPath.row]];
    [self.navigationController pushViewController:detailController animated:YES];
    
}

@end
