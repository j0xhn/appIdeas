//
//  AIRootViewController.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIRootViewController.h"
#import "AIListDataSource.h"

@interface AIRootViewController ()

@property (strong, nonatomic) AIListDataSource *dataSource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation AIRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
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
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(newIdea)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Ideas"
                                   style:UIBarButtonItemStylePlain
                                   target:nil
                                   action:nil];
    
    [self.navigationItem setBackBarButtonItem:backButton];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    
}

- (void)newIdea {
    [self.dataSource newIdea];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    AIDetailViewController *detailController = [AIDetailViewController new];
//    [self.navigationController pushViewController:detailController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
